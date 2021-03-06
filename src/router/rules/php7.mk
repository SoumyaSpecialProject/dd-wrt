
libpng:
	cd libgd && \
	CC="ccache $(ARCH)-linux-uclibc-gcc" \
	CFLAGS="$(COPTS) $(MIPS16_OPT)   -I$(TOP)/zlib/include -ffunction-sections -fdata-sections -Wl,--gc-sections" \
	CPPFLAGS="$(COPTS) $(MIPS16_OPT) -I$(TOP)/zlib/include -ffunction-sections -fdata-sections -Wl,--gc-sections" \
	LDFLAGS="$(COPTS) $(MIPS16_OPT)  -L$(TOP)/zlib -fPIC -v -Wl,--verbose" \
	$(MAKE) -C libpng
	-mkdir -p $(TOP)/libgd/libpng/.libs/include
	-cp $(TOP)/libgd/libpng/*.h $(TOP)/libgd/libpng/.libs/include
	
libpng-clean:
	cd libgd && \
	make -C libpng clean
	
libpng-configure:
	cd libgd && \
	cd libpng &&   ./configure --host=$(ARCH)-linux-uclibc  --disable-shared --enable-static CC="ccache $(ARCH)-linux-uclibc-gcc" CFLAGS="-fPIC -DNEED_PRINTF $(COPTS) $(MIPS16_OPT) -I$(TOP)/zlib/include" CPPFLAGS="-fPIC -DNEED_PRINTF $(COPTS) $(MIPS16_OPT) -I$(TOP)/zlib/include" 'LDFLAGS=-L$(TOP)/zlib'	
	cd libgd && \
	CC="ccache $(ARCH)-linux-uclibc-gcc" \
	CFLAGS="$(COPTS) $(MIPS16_OPT)   -I$(TOP)/zlib/include -ffunction-sections -fdata-sections -Wl,--gc-sections" \
	CPPFLAGS="$(COPTS) $(MIPS16_OPT) -I$(TOP)/zlib/include -ffunction-sections -fdata-sections -Wl,--gc-sections" \
	LDFLAGS="$(COPTS) $(MIPS16_OPT)  -L$(TOP)/zlib -fPIC -v -Wl,--verbose" \
	$(MAKE) -C libpng

	
	
libgd: libpng minidlna
	CC="ccache $(ARCH)-linux-uclibc-gcc" \
	CFLAGS="$(COPTS) $(MIPS16_OPT)   -I$(TOP)/minidlna/jpeg-8 -ffunction-sections -fdata-sections -Wl,--gc-sections" \
	CPPFLAGS="$(COPTS) $(MIPS16_OPT) -I$(TOP)/minidlna/jpeg-8 -ffunction-sections -fdata-sections -Wl,--gc-sections" \
	LDFLAGS="$(COPTS) $(MIPS16_OPT)  -lm -L$(TOP)/zlib -L$(TOP)/libgd/libpng/.libs -lpng12 -L$(TOP)/minidlna/lib -ljpeg -fPIC -v -Wl,--verbose" \
	$(MAKE) -C libgd
	
libgd-clean:
	make -C libgd clean
	
libgd-configure:
	cd libgd && ./configure --host=$(ARCH)-linux-uclibc  \
	--with-jpeg=$(TOP)/minidlna/jpeg-8 \
	--without-xpm \
	--without-x \
	--without-tiff \
	--without-freetype \
	--without-fontconfig \
	--without-x \
	--disable-shared \
	--enable-static \
	--with-zlib \
	CC="ccache $(ARCH)-linux-uclibc-gcc" \
	CFLAGS="-fPIC -DNEED_PRINTF $(COPTS) $(MIPS16_OPT) -I$(TOP)/minidlna/jpeg-8 -I$(TOP)/zlib" \
	LDFLAGS="-L$(TOP)/minidlna/lib -L$(TOP)/zlib -L$(TOP)/libgd/libpng/.libs -lpng12" \
	LIBPNG_CFLAGS="-I$(TOP)/libgd/libpng" \
	LIBPNG_LIBS="-L$(TOP)/libgd/libpng/.libs -lpng12"

	CC="ccache $(ARCH)-linux-uclibc-gcc" \
	CFLAGS="$(COPTS) $(MIPS16_OPT)   -I$(TOP)/minidlna/jpeg-8 -ffunction-sections -fdata-sections -Wl,--gc-sections" \
	CPPFLAGS="$(COPTS) $(MIPS16_OPT) -I$(TOP)/minidlna/jpeg-8 -ffunction-sections -fdata-sections -Wl,--gc-sections" \
	LDFLAGS="$(COPTS) $(MIPS16_OPT)  -lm -L$(TOP)/zlib -L$(TOP)/libgd/libpng/.libs -lpng12 -L$(TOP)/minidlna/lib -ljpeg -fPIC -v -Wl,--verbose" \
	LIBPNG_CFLAGS="-I$(TOP)/libgd/libpng" \
	LIBPNG_LIBS="-L$(TOP)/libgd/libpng/.libs -lpng12" \
	$(MAKE) -C libgd

libgd-install:



libmcrypt:
	CC="ccache $(ARCH)-linux-uclibc-gcc"
	CFLAGS="$(COPTS) $(MIPS16_OPT)   -I$(TOP)/zlib/include -ffunction-sections -fdata-sections -Wl,--gc-sections" \
	CPPFLAGS="$(COPTS) $(MIPS16_OPT) -I$(TOP)/zlib/include -ffunction-sections -fdata-sections -Wl,--gc-sections" \
	LDFLAGS="$(COPTS) $(MIPS16_OPT)  -L$(TOP)/zlib -fPIC -v -Wl,--verbose" \
	$(MAKE) -C libmcrypt
	
libmcrypt-install:
	mkdir -p $(INSTALLDIR)/libmcrypt/usr/lib ; true
	cp -av libmcrypt/lib/.libs/libmcrypt.so* $(INSTALLDIR)/libmcrypt/usr/lib/ ; true

libmcrypt-clean:
	make -C libmcrypt clean
	
libmcrypt-configure:
	cd libmcrypt &&   ./configure  ac_cv_host=$(ARCH)-uclibc-linux --target=$(ARCH)-linux --host=$(ARCH)  --enable-shared --enable-static CC="ccache $(ARCH)-linux-uclibc-gcc" CFLAGS="-fPIC -DNEED_PRINTF -Drpl_realloc=realloc -Drpl_malloc=malloc $(COPTS) $(MIPS16_OPT) -I$(TOP)/zlib/include" CPPFLAGS="-fPIC -DNEED_PRINTF $(COPTS) $(MIPS16_OPT) -I$(TOP)/zlib/include" 'LDFLAGS=-L$(TOP)/zlib'	
	CC="ccache $(ARCH)-linux-uclibc-gcc" \
	CFLAGS="$(COPTS) $(MIPS16_OPT)   -I$(TOP)/zlib/include -ffunction-sections -fdata-sections -Wl,--gc-sections" \
	CPPFLAGS="$(COPTS) $(MIPS16_OPT) -I$(TOP)/zlib/include -ffunction-sections -fdata-sections -Wl,--gc-sections" \
	LDFLAGS="$(COPTS) $(MIPS16_OPT)  -L$(TOP)/zlib -fPIC -v -Wl,--verbose" \
	$(MAKE) -C libmcrypt


php7: libxml2 libmcrypt
	CC="ccache $(ARCH)-linux-uclibc-gcc" \
	CFLAGS="$(COPTS) $(MIPS16_OPT)   -I$(TOP)/libgd/libpng -I$(TOP)/libxml2/include -I$(TOP)/curl/include -ffunction-sections -fdata-sections -Wl,--gc-sections" \
	CPPFLAGS="$(COPTS) $(MIPS16_OPT) -I$(TOP)/libgd/libpng -I$(TOP)/libxml2/include -I$(TOP)/curl/include -ffunction-sections -fdata-sections -Wl,--gc-sections" \
	LDFLAGS="$(COPTS) $(MIPS16_OPT) -L$(TOP)/libgd/libpng/.libs -L$(TOP)/libxml2/.libs -lxml2 -L$(TOP)/glib20/libiconv/lib/.libs -liconv -L$(TOP)/zlib -L$(TOP)/openssl -L$(TOP)/zlib -lz -L$(TOP)/curl/lib/.libs -lcurl -lcrypto -lssl -ldl -fPIC -v -Wl,--verbose" \
	$(MAKE) -C php7
	
	
PHP_CONFIGURE_ARGS= \
	--program-prefix= \
	--program-suffix= \
	--prefix=/usr \
	--exec-prefix=/usr \
	--bindir=/usr/bin \
	--datadir=/usr/share \
	--infodir=/usr/share/info \
	--includedir=/ \
	--oldincludedir=/ \
	--libdir=/usr/lib \
	--libexecdir=/usr/lib \
	--localstatedir=/var \
	--mandir=/usr/share/man \
	--sbindir=/usr/sbin \
	--sysconfdir=/etc \
	--with-config-file-scan-dir=/jffs/etc \
	--with-iconv-dir="$(TOP)/glib20/libiconv" \
	--enable-shared \
	--enable-static \
	--disable-rpath \
	--disable-debug \
	--without-pear \
	--with-libxml-dir="$(TOP)/libxml2" \
	--with-config-file-path=/etc \
	--disable-ipv6 \
	--disable-short-tags \
	--disable-ftp \
	--without-gettext \
	--disable-mbregex \
	--with-openssl-dir="$(TOP)/openssl" \
	--with-openssl=shared,"$(TOP)/openssl" \
	--with-kerberos=no \
	--disable-phar \
	--with-kerberos=no \
	--disable-soap \
	--enable-sockets \
	--disable-tokenizer \
	--without-freetype-dir \
	--without-xpm-dir \
	--without-t1lib \
	--disable-gd-jis-conv \
	--enable-cli \
	--enable-cgi \
	--enable-zip \
	--enable-mbstring \
	--with-gd \
	--with-zlib \
	--with-zlib-dir="$(TOP)/zlib" \
	--with-png-dir="$(TOP)/libgd/libpng/.libs" \
	--with-jpeg-dir="$(TOP)/minidlna/jpeg-8" \
	--with-mcrypt="$(TOP)/libmcrypt" \
	--with-curl="$(TOP)/curl" \
	php_cv_cc_rpath="no" \
	iconv_impl_name="gnu_libiconv" \
	ac_cv_lib_png_png_write_image="yes" \
	ac_cv_lib_crypt_crypt="yes" \
	ac_cv_lib_z_gzgets="yes" \
	ac_cv_php_xml2_config_path="$(TOP)/libxml2/xml2-config" \
	ac_cv_lib_z_gzgets="yes" \
	ac_cv_lib_crypto_X509_free="yes" \
	ac_cv_lib_ssl_DSA_get_default_method="yes" \
	ac_cv_func_crypt="yes" \
	ac_cv_lib_crypto_CRYPTO_free="yes" \
	ac_cv_header_openssl_crypto_h="yes" \
	ac_cv_lib_ssl_SSL_CTX_set_ssl_version="yes" \
	ac_cv_glob="yes" \
	ICONV_DIR="$(TOP)/glib20/libiconv" \
	OPENSSL_LIBDIR="$(TOP)/openssl" \
	PHP_OPENSSL_DIR="$(TOP)/openssl" \
	PHP_CURL="$(TOP)/curl" \
	PHP_ICONV="$(TOP)/glib20/libiconv" \
	EXTRA_CFLAGS="-L$(TOP)/glib20/libiconv/lib/.libs -liconv -I$(TOP)/libmcrypt -I$(TOP)/zlib -I$(TOP)/libgd/libpng -lcrypt -L$(TOP)/openssl -I$(TOP)/curl/include -lcrypto -lssl" \
	EXTRA_LIBS="-liconv " \
	EXTRA_LDFLAGS="-L$(TOP)/libmcrypt/lib/.libs -lmcrypt -L$(TOP)/glib20/libiconv/lib/.libs -liconv -L$(TOP)/libxml2/.libs -lxml2 -L$(TOP)/zlib -L$(TOP)/libgd/libpng/.libs -lpng -L$(TOP)/libgd/src/.libs -lgd -L$(TOP)/openssl -L$(TOP)/zlib -lz -L$(TOP)/curl/lib/.libs -lcurl -lcrypto -lssl -lcrypt -ldl" \
	EXTRA_LDFLAGS_PROGRAM="-L$(TOP)/libmcrypt/lib/.libs -lmcrypt -L$(TOP)/glib20/libiconv/lib/.libs -liconv -L$(TOP)/libxml2/.libs -lxml2 -L$(TOP)/libgd/libpng/.libs -lpng -L$(TOP)/libgd/src/.libs -lgd -L$(TOP)/openssl -L$(TOP)/zlib -lz -L$(TOP)/curl/lib/.libs -lcurl -lcrypto -lssl -lcrypt -ldl"

ifeq ($(ARCH),mips64)
PHP_ENDIAN=ac_cv_c_bigendian_php="yes"
endif
ifeq ($(ARCH),mips)
PHP_ENDIAN=ac_cv_c_bigendian_php="yes"
endif
ifeq ($(ARCH),armeb)
PHP_ENDIAN=ac_cv_c_bigendian_php="yes"
endif
ifeq ($(ARCH),powerpc)
PHP_ENDIAN=ac_cv_c_bigendian_php="yes"
endif

	
php7-configure: minidlna-configure libpng-configure libgd-configure libxml2-configure libpng libgd libxml2 zlib curl
	rm -f php7/config.cache
	rm -rf php7/autom4te.cache
	cd php7 && autoconf
	cd php7 && './configure'  '--host=$(ARCH)-linux-uclibc' $(PHP_ENDIAN) $(PHP_CONFIGURE_ARGS) \
	'CFLAGS=$(COPTS) -I$(TOP)/minidlna/jpeg-8 -I$(TOP)/libmcrypt -I$(TOP)/libgd/libpng -I$(TOP)/libxml2/include -I$(TOP)/glib20/libiconv/include -I$(TOP)/curl/include -DNEED_PRINTF -L$(TOP)/glib20/libiconv/lib/.libs -L$(TOP)/zlib -lz -L$(TOP)/curl/lib/.libs -lcurl -liconv' \
	'LDFLAGS=-L$(TOP)/minidlna/lib -ljpeg -L$(TOP)/libmcrypt/lib/.libs -lmcrypt -L$(TOP)/libxml2/.libs -L$(TOP)/zlib -L$(TOP)/libgd/libpng/.libs -lpng -L$(TOP)/libgd/src/.libs -lgd -L$(TOP)/glib20/libiconv/lib/.libs -liconv -L$(TOP)/openssl -L$(TOP)/zlib -lz -L$(TOP)/curl/lib/.libs -lcurl -lcrypto -lssl -lcrypt -ldl'
	printf "#define HAVE_GLOB 1\n" >>$(TOP)/php7/main/php_config.h

php7-clean:
	if test -e "php7/Makefile"; then make -C php7 clean; fi

php7-install:
ifeq ($(CONFIG_PHPCMD),y)
	install -D php7/sapi/cli/.libs/php $(INSTALLDIR)/php7/usr/bin/php
endif
ifneq ($(CONFIG_PHPCGI),y)
	install -D php7/sapi/cli/.libs/php $(INSTALLDIR)/php7/usr/bin/php
endif
ifeq ($(CONFIG_PHPCGI),y)
	install -D php7/sapi/cgi/.libs/php-cgi $(INSTALLDIR)/php7/usr/bin/php-cgi
	mkdir -p $(INSTALLDIR)/php7/etc
	printf "short_open_tag=on\ncgi.fix_pathinfo=1\n" >$(INSTALLDIR)/php7/etc/php.ini
	printf "post_max_size = 32M\n" >>$(INSTALLDIR)/php7/etc/php.ini
	printf "upload_max_filesize = 32M\n" >>$(INSTALLDIR)/php7/etc/php.ini
	printf "output_buffering = Off\n" >>$(INSTALLDIR)/php7/etc/php.ini
endif
ifeq ($(CONFIG_LIGHTTPD),y)
	install -D php7/sapi/cgi/.libs/php-cgi $(INSTALLDIR)/php7/usr/bin/php-cgi
	mkdir -p $(INSTALLDIR)/php7/etc
	printf "short_open_tag=on\ncgi.fix_pathinfo=1\n" >$(INSTALLDIR)/php7/etc/php.ini
	printf "post_max_size = 32M\n" >>$(INSTALLDIR)/php7/etc/php.ini
	printf "upload_max_filesize = 32M\n" >>$(INSTALLDIR)/php7/etc/php.ini
	printf "output_buffering = Off\n" >>$(INSTALLDIR)/php7/etc/php.ini
endif
