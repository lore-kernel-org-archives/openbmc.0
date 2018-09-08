Return-Path: <akuster808@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::42c; helo=mail-pf1-x42c.google.com;
 envelope-from=akuster808@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="ebjJgg8p"; 
 dkim-atps=neutral
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com
 [IPv6:2607:f8b0:4864:20::42c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4275Rr6bMzzF3Sb
 for <openbmc@lists.ozlabs.org>; Sun,  9 Sep 2018 06:26:13 +1000 (AEST)
Received: by mail-pf1-x42c.google.com with SMTP id h69-v6so8590914pfd.4
 for <openbmc@lists.ozlabs.org>; Sat, 08 Sep 2018 13:26:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=NHKkE57kpkcpPdbR5mzdVGAThxzhk3tARg4tVkB6wjo=;
 b=ebjJgg8p0RhrfURxOPxCJSrf05v4W2aHKxCaan+mn3gJdANaGfucUoxmyRHmtn5zFe
 ylMh10FC7FSVNR8aUD49ySMGLWw26NlLAuj3QJhTv74d8DOISmQI68K1fZqp8wWNUfeo
 8cMh0Xeb1mKqrEkvxczUdOwR0S4M+pQkBOXKp0TAz48mvq/vUqwNFqBOgx5dpMXt6AZT
 t0N8V94BeGjF3NYfBFAkVoFHdW7k887wf+zT3611AOZ9/hEF/rcqh9agV0bJxeb8siPW
 6v2DaMnlu9n6vT1FGztJpEREix+fKIPoZ8rNClaF20vhRxbkwl+5N63wHmgnDl/hQreb
 HOkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=NHKkE57kpkcpPdbR5mzdVGAThxzhk3tARg4tVkB6wjo=;
 b=YAcLe352P7zr0rZRn1RNPSH72osyJaD8GkGmC0b3Be+Q+fBdF9OxXapodMNMasfdKA
 V/QcRy87W0acxBl8GTSvSuggApu+uygbKWQpKcGFEFoz6ym1eJ/klDVu0SpiK2MZsrsK
 B59HeiOFJ5RsdMGRYsFl1cSqpY7QUxqQbWsmRDnEJmxL38810sMmjfG8Qh21LhHSUl3p
 M2Lj+4DMPxGtTCcPzQ9pdAujET1DK084f8eSjLDHP0EDJvXQk2whOrmMp6alsSE/iG8+
 mxdyV+L6lsPB/xhCdWSLocj1KvzUOvFqtdrXwKRvlhCp4UWFWZqyyFDTx9tZU2QgiUAd
 KrdQ==
X-Gm-Message-State: APzg51BYvFTk6de/uJjoE8asYMsf1Opl3g8YY8604EYMjhGKFqVdOoT2
 JfyqZAVNE+pTfRE3NvWTumfbIXYe
X-Google-Smtp-Source: ANB0VdYW9lQTgkUzOO2oKoYSwKpk57r2huhrTn/V5ODVv3+at9O4Ecd4su8ne4iA3B6Vs9bRF41/6w==
X-Received: by 2002:a62:c288:: with SMTP id
 w8-v6mr15497182pfk.92.1536438370858; 
 Sat, 08 Sep 2018 13:26:10 -0700 (PDT)
Received: from ?IPv6:2601:202:4180:c33:298f:c8f9:a134:db17?
 ([2601:202:4180:c33:298f:c8f9:a134:db17])
 by smtp.gmail.com with ESMTPSA id j191-v6sm16548274pfc.136.2018.09.08.13.26.09
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 08 Sep 2018 13:26:10 -0700 (PDT)
Subject: Re: [oe] [sumo][meta-networking][PATCH] split net-snmp-libs into
 smaller packages
To: Alexander Filippov <a.filippov@yadro.com>,
 openembedded-devel@lists.openembedded.org,
 Joe MacDonald <joe_macdonald@mentor.com>
Cc: openbmc@lists.ozlabs.org
References: <20180905161049.13809-1-a.filippov@yadro.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
 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
 8CS2NxU=
Message-ID: <148c879d-6ae3-0fc0-b65b-a0d366b1b5ac@gmail.com>
Date: Sat, 8 Sep 2018 13:26:09 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20180905161049.13809-1-a.filippov@yadro.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Mailman-Approved-At: Mon, 10 Sep 2018 10:12:06 +1000
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.27
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Sat, 08 Sep 2018 20:26:18 -0000



On 09/05/2018 09:10 AM, Alexander Filippov wrote:
> By default `net-snmp-libs` contains all compiled libs.
> This commit splits `net-snmp-libs` into subpackages for each library.
>
> This allows for smaller resulting image due to finer packaging.
>
> Signed-off-by: Alexander Filippov <a.filippov@yadro.com>
Please submit for master.
> ---
>  .../recipes-protocols/net-snmp/net-snmp_5.7.3.bb   | 23 ++++++++++++++++++----
>  1 file changed, 19 insertions(+), 4 deletions(-)
>
> diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.3.bb b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.3.bb
> index faf73a563..4ea0a5915 100644
> --- a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.3.bb
> +++ b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.3.bb
> @@ -173,17 +173,21 @@ net_snmp_sysroot_preprocess () {
>      fi
>  }
>  
> -PACKAGES += "${PN}-libs ${PN}-mibs ${PN}-server ${PN}-client ${PN}-server-snmpd ${PN}-server-snmptrapd"
> +PACKAGES += "${PN}-libs ${PN}-mibs ${PN}-server ${PN}-client \
> +             ${PN}-server-snmpd ${PN}-server-snmptrapd \
> +             ${PN}-lib-netsnmp ${PN}-lib-agent ${PN}-lib-helpers \
> +             ${PN}-lib-mibs ${PN}-lib-trapd"
>  
>  # perl module
>  PACKAGES += "${@bb.utils.contains('PACKAGECONFIG', 'perl', '${PN}-perl-modules', '', d)}"
>  
>  ALLOW_EMPTY_${PN} = "1"
>  ALLOW_EMPTY_${PN}-server = "1"
> +ALLOW_EMPTY_${PN}-libs = "1"
>  
>  FILES_${PN}-perl-modules = "${libdir}/perl/*"
>  
> -FILES_${PN}-libs = "${libdir}/lib*${SOLIBS}"
> +FILES_${PN}-libs = ""
>  FILES_${PN}-mibs = "${datadir}/snmp/mibs"
>  FILES_${PN}-server-snmpd = "${sbindir}/snmpd \
>                              ${sysconfdir}/snmp/snmpd.conf \
> @@ -196,6 +200,12 @@ FILES_${PN}-server-snmptrapd = "${sbindir}/snmptrapd \
>                                  ${systemd_unitdir}/system/snmptrapd.service \
>  "
>  
> +FILES_${PN}-lib-netsnmp = "${libdir}/libnetsnmp${SOLIBS}"
> +FILES_${PN}-lib-agent = "${libdir}/libnetsnmpagent${SOLIBS}"
> +FILES_${PN}-lib-helpers = "${libdir}/libnetsnmphelpers${SOLIBS}"
> +FILES_${PN}-lib-mibs = "${libdir}/libnetsnmpmibs${SOLIBS}"
> +FILES_${PN}-lib-trapd = "${libdir}/libnetsnmptrapd${SOLIBS}"
> +
>  FILES_${PN} = ""
>  FILES_${PN}-client = "${bindir}/* ${datadir}/snmp/"
>  FILES_${PN}-dbg += "${libdir}/.debug/ ${sbindir}/.debug/ ${bindir}/.debug/"
> @@ -219,10 +229,15 @@ SYSTEMD_SERVICE_${PN}-server-snmptrapd =  "snmptrapd.service"
>  RDEPENDS_${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'perl', 'net-snmp-perl-modules', '', d)}"
>  RDEPENDS_${PN} += "net-snmp-client"
>  RDEPENDS_${PN}-server-snmpd += "net-snmp-mibs"
> -RDEPENDS_${PN}-server-snmptrapd += "net-snmp-server-snmpd"
> +RDEPENDS_${PN}-server-snmptrapd += "net-snmp-server-snmpd ${PN}-lib-trapd"
>  RDEPENDS_${PN}-server += "net-snmp-server-snmpd net-snmp-server-snmptrapd"
>  RDEPENDS_${PN}-client += "net-snmp-mibs net-snmp-libs"
> -RDEPENDS_${PN}-libs += "libpci"
> +RDEPENDS_${PN}-libs += "libpci \
> +                        ${PN}-lib-netsnmp \
> +                        ${PN}-lib-agent \
> +                        ${PN}-lib-helpers \
> +                        ${PN}-lib-mibs \
> +"
>  RDEPENDS_${PN}-ptest += "perl \
>                           perl-module-test \
>                           perl-module-file-basename \
