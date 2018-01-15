Return-Path: <joel.stan@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400d:c09::244; helo=mail-qk0-x244.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="IH0yuOTv"; 
 dkim-atps=neutral
Received: from mail-qk0-x244.google.com (mail-qk0-x244.google.com
 [IPv6:2607:f8b0:400d:c09::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zL4yT5MMvzF0Z6
 for <openbmc@lists.ozlabs.org>; Tue, 16 Jan 2018 07:41:37 +1100 (AEDT)
Received: by mail-qk0-x244.google.com with SMTP id d18so18368181qke.7
 for <openbmc@lists.ozlabs.org>; Mon, 15 Jan 2018 12:41:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=zPoafsQbIE8KfrMIzGHBtVpSl4VRfqPZyDX6LFAorx0=;
 b=IH0yuOTvSRvXR7VR3tTSd6y70nFqORqJX9MHG6wrlN0ZVaUuXo98aPBtURSBZlYilV
 HSw+Nq/+7d36Ahv8aXd48m4XwCh/361MFZ3pbg2qbrVDdVT8faAwsXXfNKyHEDUMCPCd
 CddfUM+WB7vmgL2gimOrRIPr2lHJ/QbW0cQyp4u8fGyXW3jGdYrQ0WBXbZ5a/RogROfd
 GgnHsl3pxGWpTgK9+bmjhWTYP8zxkeXiSisZN0RJdMVybt1wWs1HWFKJIqBsy6+eVWgC
 8XEc5TfVgyW135fPcspE+uAo9UEO5Q7l3N4eeLp+T98Dc2qLEctOGaFTv5kHJ9Z+qvP5
 +6Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc:content-transfer-encoding;
 bh=zPoafsQbIE8KfrMIzGHBtVpSl4VRfqPZyDX6LFAorx0=;
 b=HGk7TtmwYQPgEfhintYTHhOup5gP7L/REMbEzxClPN9mz8jrv3RXbheXKDPE2QLJLC
 5SMeDKa4HHXqPvR9rYbQsH7mHOwYiQ/WajWUiGLNwbwR/e29+ikgAtM/Av1qPMLLv4Ki
 vHzMUOugXgyBldh/eZf/aKOBCiRaD3PPrd29CZRQKUkCOHsUueHzYsFvGBNVzviL0CpC
 iUh0ZentodC7hRF8EK3Z0CjsvsUIuecVB4n36hkCOvNZKfyiXwEYsee2pLpp7zzK4wCN
 Sd2NnPBouIuoFMX7deWaTCY8rjC57reepwjY3RiTT6NG9TnaYZTP6TBL+rE/Qoi6/lc1
 AoVQ==
X-Gm-Message-State: AKwxytdX1chckx9CbEfxzZb8rSLOzkCkFLyFFVCJe8PNnR6yfk877ToN
 mXqEe4E93+p5zdwqF3EAIP9KjgD4IhRgva3DSB5X9RHU
X-Google-Smtp-Source: ACJfBotdzus3nCx5fXKdvehaw7aON0EzkokUKSWEU2TNgjQFiIp5IEmvwsqouPNTA/GgwZ9oSTf2m0011ZR/BfuntN4=
X-Received: by 10.55.182.2 with SMTP id g2mr47508123qkf.273.1516048895273;
 Mon, 15 Jan 2018 12:41:35 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.200.29.9 with HTTP; Mon, 15 Jan 2018 12:41:14 -0800 (PST)
In-Reply-To: <5a5889c0.81e99f0a.ea8b9.0671SMTPIN_ADDED_BROKEN@mx.google.com>
References: <OF1BEE1A69.7AB7F612-ON00258202.0025B62E-00258202.0026D081@LocalDomain>
 <OFA6CDF979.ECB71A08-ON002581FE.00209185-002581FE.0020C312@LocalDomain>
 <2017122119444269880214@powercore.com.cn>
 <OFAA1D6998.34D1984E-ON00258202.002FCE02-00258202.002FE3C4@notes.na.collabserv.com>
 <2017122715433918020310@powercore.com.cn>
 <5a5889c0.81e99f0a.ea8b9.0671SMTPIN_ADDED_BROKEN@mx.google.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 15 Jan 2018 14:41:14 -0600
X-Google-Sender-Auth: keDqGYLh7slalgxZL3fz8m-ZPJU
Message-ID: <CACPK8XcyqJTXwFa0Ugar77BGOXitqE4PPs1PeaHkAz5nVMZR+Q@mail.gmail.com>
Subject: Re: Simple method for the NFS
To: "xiao.han@powercore.com.cn" <xiao.han@powercore.com.cn>
Cc: openbmc <openbmc@lists.ozlabs.org>, Yu <shyulei@cn.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 15 Jan 2018 20:41:38 -0000

On Fri, Jan 12, 2018 at 2:35 AM, xiao.han@powercore.com.cn
<xiao.han@powercore.com.cn> wrote:
> Dear All:
>
>
>    I fount a simple method for the NFS:

Thanks for sharing this!

Cheers,

Joel

>
> Enable nfs in the kernel. (CONFIG_NFS_FS=EF=BC=8CCONFIG_ROOT_NFS ...)
> Prepare the fitimage, it will be generated at
> .\build\tmp\deploy\images\palmetto\fitImage.
> Prepare the the rootfs on NFS server.
> sudo unsquashfs -f -d <nfsroot-dir> image-rofs
> in the uboot command  environment :
> ## configure network
> setenv ethaddr ea:80:ed:0a:68:d6
> setenv ipaddr 192.168.0.60
> setenv serverip 192.168.0.10
> ## set bootargs=EF=BC=8Cboot from nfs
> setenv bootargs root=3D/dev/nfs rw
> nfsroot=3D192.168.0.10:/nfsroot/obmc-rofs,nolock console=3DttyS4,115200n8
> ip=3D192.168.0.60:192.168.0.10:192.168.0.10:255.255.255.0 nfsrootdebug
> # load kernel/dtb to memory
> tftp 0x43000000 fitImage
> # boot from memory
> bootm 0x43000000
>
>
> ________________________________
> Best Regards
> *********************************************
> Xiao Han(=E9=9F=A9 =E7=AC=91)
> System Department(=E7=B3=BB=E7=BB=9F=E9=83=A8)
> Suzhou Powercore Technology Co., Ltd.
> Rm.202, Building 3B, No.9 XueSen Rd.,
> SSTT, SND, Suzhou, Jiangsu, China
> =E4=B8=AD=E5=9B=BD=E6=B1=9F=E8=8B=8F=E7=9C=81=E8=8B=8F=E5=B7=9E=E5=B8=82=
=E9=AB=98=E6=96=B0=E5=8C=BA=E7=A7=91=E6=8A=80=E5=9F=8E=E5=AD=A6=E6=A3=AE=E8=
=B7=AF9=E5=8F=B73A=E6=A5=BC3=E6=A5=BC313=E5=AE=A4
> e-mail: xiao.han@powercore.com.cn
> Tel: +86-0512-68316328-8136 =EF=BC=88China=EF=BC=89
> Cellphone: +86-158-5025-8592 =EF=BC=88China=EF=BC=89
> *********************************************
