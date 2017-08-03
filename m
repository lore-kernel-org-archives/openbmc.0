Return-Path: <andrew@aj.id.au>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xNlFV4PGQzDqJ0
 for <openbmc@lists.ozlabs.org>; Fri,  4 Aug 2017 08:33:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="nDUuvU5w"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="jZa7eQ1W"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 2CFF320B8A;
 Thu,  3 Aug 2017 18:33:16 -0400 (EDT)
Received: from web1 ([10.202.2.211])
 by compute4.internal (MEProxy); Thu, 03 Aug 2017 18:33:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm1; bh=NE8n+1hKyjISDNFbxzhGTW8dHMNll
 4/VQBsfvxVODz4=; b=nDUuvU5wl5SsetUJwMO2HCgaMWPlFISeLIXyfNxoQg0Ix
 jV2dTTXTow79TZ+e781SdU8DH0m4mp/Fk+GkXWISLt72QHYFUkiH83TZsFQUkENm
 Hmr2sWzCVmmqU4mbaBB7D6zQv1pppzh8phFVh9+UCLtCC7qq5tjPwIErjGoLtl4s
 O+XdPVb2n5A2OqH5972vHamkDtCeqzt2fNaRNWigJj3r6fXcpyTWRdyRfXmqqYKI
 l15nsf1oRMY4CZRUlrQ55kJVIdtaFhOzl0YUB/lRxDt4S0X6YQKao2j0nA/Qb9Rg
 ens2Z1fOdVQzcNqgFswCRksXTzza5vCNiZ6IJwjRA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=NE8n+1
 hKyjISDNFbxzhGTW8dHMNll4/VQBsfvxVODz4=; b=jZa7eQ1W2tcvRxT9ZKF1EB
 PwO1XmWBQ/KkX8nTrG+TB4kuQRk0ngXgwWNjGSba3832+HxyuaMDtABnIp/i3rEp
 C1sehulJF3qSmbh0vIfLpaKm3Q/F2y6OXdcsRAgaoiIiXbGWOjcf1a7uRi47/+1I
 Kv2Ou0o8pe15bMCsoCsHS+avw2Qu8V3WkF0gvXSTBtUaOxMBtyoUhg/rJuzH9dLm
 I4ELAKyRHMlJgviDEq0EsZsAZUPi8yQsOTAkRskDd1KIt1fepwowmK5WHwd683PV
 I041nYfOqGX00u403ebBsdJOl8Ux1DjflPP0HY37p9SYYiRQVN1S+Wa0wnhnZ1tw
 ==
X-ME-Sender: <xms:rKSDWUOeLCcaD-v16WHIl7o8aqWKDYB-q8KEDnn9GYVsJCEqKjoelQ>
Received: by mailuser.nyi.internal (Postfix, from userid 99)
 id F10D695237; Thu,  3 Aug 2017 18:33:15 -0400 (EDT)
Message-Id: <1501799595.3655825.1062562904.7DA58D45@webmail.messagingengine.com>
From: Andrew Jeffery <andrew@aj.id.au>
To: Anton Novikov <a.novikov@yadro.com>, openbmc@lists.ozlabs.org
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="utf-8"
X-Mailer: MessagingEngine.com Webmail Interface - ajax-7b2cde4a
Subject: Re: Arch Linux OpenSSL build fails
References: <9242f324-6e74-158f-9349-13b47088e2af@yadro.com>
In-Reply-To: <9242f324-6e74-158f-9349-13b47088e2af@yadro.com>
Date: Fri, 04 Aug 2017 08:03:15 +0930
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
X-List-Received-Date: Thu, 03 Aug 2017 22:33:20 -0000


On Fri, Aug 4, 2017, at 02:27, Anton Novikov wrote:
> | make[2]: Entering directory 
> '/home/anton/src/openbmc/build/tmp/work/x86_64-linux/openssl-native/1.0.2j-r0/openssl-1.0.2j'
> | [ -z "" ] || gcc  -fPIC -DOPENSSL_PIC -DOPENSSL_THREADS -D_REENTRANT 
> -DDSO_DLFCN -DHAVE_DLFCN_H -DOPENSSL_NO_ERR -DL_ENDIAN      -DTERMIO 
> -isystem/home/anton/src/openbmc/build/tmp/sysroots/x86_64-linux/usr/include 
> -O2 -pipe -Wall -Wa,--noexecstack -DHAVE_CRYPTODEV 
> -DUSE_CRYPTODEV_DIGESTS -DOPENSSL_IA32_SSE2 -DOPENSSL_BN_ASM_MONT 
> -DOPENSSL_BN_ASM_MONT5 -DOPENSSL_BN_ASM_GF2m -DRC4_ASM -DSHA1_ASM 
> -DSHA256_ASM -DSHA512_ASM -DMD5_ASM -DAES_ASM -DVPAES_ASM -DBSAES_ASM 
> -DGHASH_ASM -DECP_NISTZ256_ASM -Iinclude \
> |     -DFINGERPRINT_PREMAIN_DSO_LOAD -o fips_premain_dso  \
> |     fips_premain.c fipscanister.o \
> |     libcrypto.a -lgcc -ldl
> | make[3]: Entering directory 
> '/home/anton/src/openbmc/build/tmp/work/x86_64-linux/openssl-native/1.0.2j-r0/openssl-1.0.2j'
> | make[4]: Entering directory 
> '/home/anton/src/openbmc/build/tmp/work/x86_64-linux/openssl-native/1.0.2j-r0/openssl-1.0.2j'
> | /usr/bin/ld: libcrypto.a(sha1-x86_64.o): relocation R_X86_64_PC32 
> against undefined symbol `OPENSSL_ia32cap_P' can not be used when making 
> a shared object; recompile with -fPIC
> | /usr/bin/ld: final link failed: Bad value
> | collect2: error: ld returned 1 exit status
> | make[4]: *** [Makefile.shared:171: link_a.gnu] Error 1
> 

Possibly a gcc/binutils bug:
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=65248
