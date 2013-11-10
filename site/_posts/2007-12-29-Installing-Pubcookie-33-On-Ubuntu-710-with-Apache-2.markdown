---
layout: post
title: Installing Pubcookie 3.3 on Ubuntu 7.10 with Apache 2
category: coding
---

I recently had the wonderful experience of configuring UW's Pubcookie for use
on Ubuntu's package-manager version of Apache2. I took modest notes while
doing this, and it was spread out over several weeks whenever I could find the
time, so maybe don't take this as a guide so much as a few installation notes,
but these are the spots that gave me the most trouble.

This accompanies the Pubcookie Apache Module installation guide at
(http://pubcookie.org/docs/install-mod_pubcookie-3.3.html) and the UW-specific
guide notes at
(http://www.washington.edu/computing/pubcookie/uwash-install.html).

(Of course following the convention that `$` are commands run as a limited
user while `#` commands are run as root.)

1.  Ensure Apache2 is installed and configured with OpenSSL:

        # apt-get install apache2-threaded-dev apache2 openssl
        # mkdir -p /etc/apache2/ssl


2.  Obtain Weblogin Server Registration for your hostname at
    (https://server-reg.cac.washington.edu/pubcookie/)

3.  Get the UW Root Cert from (http://certs.cac.washington.edu/?req=svpem)

    I put this file at **/etc/apache2/ssl/server.pem**. This is the server's
    public key.

4.  Get the CA Bundle from
    (http://www.washington.edu/computing/pubcookie/ca-bundle.crt)

    I put this file at **/etc/apache2/ssl/ca-bundle.crt**

    This file allows the server to verify peers' certificates and is used by
    keyclient.

5.  Generate your cert's private key and have it signed by your CA.

    Information on how to generate a private key and a signature signing
    request are probably documented on whatever site is signing your
    certificate. The UW CA's Technical Information can be found at
    (https://www.washington.edu/computing/ca/infra/).

    Generating a request for the UW CA (and probably all other CAs as well) is
    simply a matter of:

        # cd /etc/apache2/ssl
        # openssl req -nodes -newkey 1024 \
            -keyout key.pem -out req.pem


    When I went through the request process, the CA gave me the following
    values to fill in to the request UI:

        Country (C)         US
        State (ST)          WA or Washington
        Organization (O)    Optional
        Organizational Unit (OU)    Optional
        Common Name (CN)    Your host's fully qualified domain name


6.  Put your private key at **/etc/apache2/ssl/key.pem** and your CA-signed
    certificate at **/etc/apache2/ssl/cert.pem**.

    (Note that the above step should generate the key and the request at these
    locations already.)

7.  Working in $HOME, get the Pubcookie tarball and unzip:

        $ mkdir -p $HOME/pubcookie
        $ wget http://www.pubcookie.org/downloads/pubcookie-3.3.3.tar.gz
        $ tar xzf pubcookie-3.3.3.tar.gz


8.  Modify the configure script to know where apache's PREFIX is. This problem
    seems to come from the fact that Apache isn't built from source locally
    when using aptitude.

    The diff for this modification is

        3783c3783
         <   APACHE_PREFIX=`$APXS -q PREFIX`
         ---
         >   APACHE_PREFIX="/usr/share/apache2" #`$APXS -q PREFIX`


    This via a message from the Pubcookie mailing list.

9.  Configure, compile install:

        $ cd $HOME/pubcookie/pubcookie-3.3.3/
        $ ./configure   \
            --enable-apache  \
            --prefix=/usr/local/pubcookie  \
            --with-apxs=/usr/bin/apxs2
        $ make
        $ sudo make install


10. Based on information from the installation guide, the following serves as
    a good checkpoint:

        $ ls -F /usr/local/pubcookie
        keyclient*      keys/


11. Here is my keyclient configuration file, **/usr/local/pubcookie/config**

        # ssl config
        ssl_key_file: /etc/apache2/ssl/key.pem
        ssl_cert_file: /etc/apache2/ssl/cert.pem

        # keyclient-specific config
        keymgt_uri: https://weblogin.washington.edu:2222
        ssl_ca_file: /etc/apache2/ssl/ca-bundle.crt


12. Run keyclient to request a new key and to download the "granting"
    certificate:

        # cd /user/local/pubcookie
        # ./keyclient
        # ./keyclient -G keys/pubcookie_granting.cert


13. Create a pubcookie load file so we can continue to use Ubuntu's
    methodology for managing Apache extensions (e.g. using `a2enmod` and
    `a2dismod`, which really only create/modify symlinks in
    **/etc/apache2/mods-enabled** but are sometimes reportedly used by other
    installation scripts):

        # echo 'LoadModule pubcookie_module /usr/lib/apache2/modules/mod_pubcookie.so' \
        > /etc/apache2/mods-available/pubcookie.load


14. Stop Apache and load the pubcookie module:

        # apache2ctl stop
        # a2enmod pubcookie


15. Set Pubcookie directives in **/etc/apache2/httpd.conf**:

        PubcookieGrantingCertFile /usr/local/pubcookie/keys/pubcookie_granting.cert
        PubcookieSessionKeyFile /etc/apache2/ssl/key.pem
        PubcookieSessionCertFile /etc/apache2/ssl/cert.pem
        PubcookieLogin https://weblogin.washington.edu/
        PubcookieLoginMethod POST
        PubcookieDomain .washington.edu
        PubcookieKeyDir /usr/local/pubcookie/keys/
        PubCookieAuthTypeNames UWNetID null SecurID


    Note that Ubuntu's Apache likes to have lots of configuration files. The
    main configuration happens in **/etc/apache2/apache2.conf** while "user"
    modifications appen in the httpd.conf file as per above. You will also
    need to have Apache listen for SSL requests on port 443 by modifying
    **/etc/apache2/ports.conf** to include

        Listen *:443


16. Enable SSL on your default site. This can usually be done by modifying
    **/etc/apache2/sites-available/default** to include

        SSLEngine on
        SSLCertificateFile /etc/apache2/ssl/cert.pem
        SSLCertificateKeyFile /etc/apache2/ssl/key.pem


    You might be able to get away with only enabling SSL on select virtual
    hosts if your environment is such that you have multiple host names
    pointing to the same Apache instance. I was able to accomplish this to
    some degree but am still working out a few ambiguities that Apache isn't
    telling me about.

17. Restart Apache and you're good to go:

        # apache2ctl -k start


You now have the usual **.htaccess** directives at your disposal. E.g.:

    AuthType UWNetID
    Require valid-user


Have some sorbet?
