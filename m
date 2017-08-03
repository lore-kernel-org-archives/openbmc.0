Return-Path: <a.novikov@yadro.com>
X-Greylist: delayed 350 seconds by postgrey-1.36 at bilbo;
 Fri, 04 Aug 2017 03:02:40 AEST
Authentication-Results: lists.ozlabs.org;
 dkim=fail reason="signature verification failed" (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.b="OGer0iDH"; 
 dkim-atps=neutral
Received: from mta-01.yadro.com (mta-01.yadro.com [89.207.88.251])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xNbw04gRHzDq7c
 for <openbmc@lists.ozlabs.org>; Fri,  4 Aug 2017 03:02:40 +1000 (AEST)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id A63CA450A9
 for <openbmc@lists.ozlabs.org>; Thu,  3 Aug 2017 16:56:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-language:content-transfer-encoding:content-type
 :content-type:mime-version:user-agent:date:date:message-id
 :subject:subject:from:from:received:received:received; s=mta-01;
 t=1501779404; x=1503593805; bh=gwlpk4Bdbig5Zwbp647V2tSgthRKhHgm
 cw7C26O0tMo=; b=OGer0iDH0oOalKI+RojM4PMlOILbnG3TFDXAZMYmY7+qNz3L
 xFSB96XAxlVSbPzCRb3mjryPRQRy9fCFtWc4dP/u1D+k2Zm/wgf/N3QTRpyx/4rE
 kVkKqh85xWcU26GQNyrI9NZnDixW9qFCvqwiBpBBB98AHpTIE9VyFr9KtmE=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5bXwYOu5JY3j for <openbmc@lists.ozlabs.org>;
 Thu,  3 Aug 2017 19:56:44 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com
 [172.17.10.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id D38F044F5C
 for <openbmc@lists.ozlabs.org>; Thu,  3 Aug 2017 19:56:44 +0300 (MSK)
Received: from [172.17.15.146] (172.17.15.146) by T-EXCH-02.corp.yadro.com
 (172.17.10.102) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Thu, 3 Aug
 2017 19:56:42 +0300
To: <openbmc@lists.ozlabs.org>
From: Anton Novikov <a.novikov@yadro.com>
Subject: Arch Linux OpenSSL build fails
Message-ID: <9242f324-6e74-158f-9349-13b47088e2af@yadro.com>
Date: Thu, 3 Aug 2017 19:57:41 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [172.17.15.146]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-02.corp.yadro.com (172.17.10.102)
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 03 Aug 2017 17:02:42 -0000

| make[2]: Entering directory 
'/home/anton/src/openbmc/build/tmp/work/x86_64-linux/openssl-native/1.0.2j-r0/openssl-1.0.2j'
| [ -z "" ] || gcc  -fPIC -DOPENSSL_PIC -DOPENSSL_THREADS -D_REENTRANT 
-DDSO_DLFCN -DHAVE_DLFCN_H -DOPENSSL_NO_ERR -DL_ENDIAN      -DTERMIO 
-isystem/home/anton/src/openbmc/build/tmp/sysroots/x86_64-linux/usr/include 
-O2 -pipe -Wall -Wa,--noexecstack -DHAVE_CRYPTODEV 
-DUSE_CRYPTODEV_DIGESTS -DOPENSSL_IA32_SSE2 -DOPENSSL_BN_ASM_MONT 
-DOPENSSL_BN_ASM_MONT5 -DOPENSSL_BN_ASM_GF2m -DRC4_ASM -DSHA1_ASM 
-DSHA256_ASM -DSHA512_ASM -DMD5_ASM -DAES_ASM -DVPAES_ASM -DBSAES_ASM 
-DGHASH_ASM -DECP_NISTZ256_ASM -Iinclude \
|     -DFINGERPRINT_PREMAIN_DSO_LOAD -o fips_premain_dso  \
|     fips_premain.c fipscanister.o \
|     libcrypto.a -lgcc -ldl
| make[3]: Entering directory 
'/home/anton/src/openbmc/build/tmp/work/x86_64-linux/openssl-native/1.0.2j-r0/openssl-1.0.2j'
| make[4]: Entering directory 
'/home/anton/src/openbmc/build/tmp/work/x86_64-linux/openssl-native/1.0.2j-r0/openssl-1.0.2j'
| /usr/bin/ld: libcrypto.a(sha1-x86_64.o): relocation R_X86_64_PC32 
against undefined symbol `OPENSSL_ia32cap_P' can not be used when making 
a shared object; recompile with -fPIC
| /usr/bin/ld: final link failed: Bad value
| collect2: error: ld returned 1 exit status
| make[4]: *** [Makefile.shared:171: link_a.gnu] Error 1
