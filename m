Return-Path: <SRS0=2onU=LS=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 345DFC48BDF
	for <openbmc@archiver.kernel.org>; Thu, 24 Jun 2021 08:24:00 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A0307613E8
	for <openbmc@archiver.kernel.org>; Thu, 24 Jun 2021 08:23:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A0307613E8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G9Y7f6hfVz309y
	for <openbmc@archiver.kernel.org>; Thu, 24 Jun 2021 18:23:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=bkkDh3gi;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62f;
 helo=mail-pl1-x62f.google.com; envelope-from=parishrutb@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=bkkDh3gi; dkim-atps=neutral
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [IPv6:2607:f8b0:4864:20::62f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G9Y7951Lhz2ymN
 for <openbmc@lists.ozlabs.org>; Thu, 24 Jun 2021 18:23:32 +1000 (AEST)
Received: by mail-pl1-x62f.google.com with SMTP id i4so2548529plt.12
 for <openbmc@lists.ozlabs.org>; Thu, 24 Jun 2021 01:23:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=p47BmZIrw5SRn/nVEHtTVNEnyKuJm5oMz72gwiJP5Mc=;
 b=bkkDh3giDTjcbzJ0+di3Fmba174qsQaxb5fuW4aqvw4Ck4gcdqV9wOgMO+gavN3ZQ1
 5qi4MImcKRLyW1tJGb1F0WEz4LziK7q6ThHNuCKKw/jZuTbVUWihTmqkipWc65YD1+zB
 OBUjqJtS+3NsfdxRFT0Q4/DbNFD1ZHMwYKAOhuVgGrW7n4DmQxobLHsFoyr9GIcCTJnX
 cm0odthbo0tW5xvsdpVL6UxmyixfMhc3ihf7E4qqfc1vdx+GApXh8O/8QB5PYHxlaZS5
 VZi5sNkGFJEPI9UYN9ZQ6u8jkTWu3ZndyC5w3n0X4pUDl6X3z/jqV0tOUdNT8ydJpECS
 aObg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=p47BmZIrw5SRn/nVEHtTVNEnyKuJm5oMz72gwiJP5Mc=;
 b=TFtmZJWKufSMBa8b8P7MlbTaHjMmM2f6H8iOzecL1N2p/3i07jTXBuGS5GOQh7zLtz
 880RbEQ64yt/GwaBd4LmOvxp/jC3TU3fgumjfgY871gzuFeOEymHJhUmO1vTmdiXt7sU
 kYaNa8U1o6AwSYx8PP8GOujmywA8MdMkQg4Ic/9kgTyBZaeBCNvTMShWMPR4X4NZIDgO
 59/WaP9DqSwSRWIzIVtzOHV09FF6CbDB6x6eA1TKc/KAOhpa/vsPFbP1sNXW+hOT4a6g
 Rtbo2PzEBqCNKNEYOprptlz6eAyDHL4zoex22xqV+xUiPAdooNA2iwgGMukzav0Cuz8v
 CSYg==
X-Gm-Message-State: AOAM533ew+bAr9km5VIu3CXXVSzbZX5tNqF68cTVt86obWhhaVJVVh5w
 3QquzYCu4wq4khfqAG9KawYq5ISNJrp2Nh7dOmbP59WfK1Q=
X-Google-Smtp-Source: ABdhPJyFG+1XfxVO7zPgiVgHAYiJJu/iMJ/6FWAfojDEKjnzAtAgfDuHcmiwbjb9yfbwCUiy9csIFYHO+2K4pAfSU9E=
X-Received: by 2002:a17:90b:810:: with SMTP id
 bk16mr4261973pjb.2.1624523008945; 
 Thu, 24 Jun 2021 01:23:28 -0700 (PDT)
MIME-Version: 1.0
From: Parishrut Bhatia <parishrutb@gmail.com>
Date: Thu, 24 Jun 2021 13:53:15 +0530
Message-ID: <CA+FKyEW8g2EKo2Wz0og8p2m_JtDnJG5j1CjJd_oJ-fKMGvM2rA@mail.gmail.com>
Subject: Requesting feedback on in-progress GUI designs (I/O Enclosure
 Settings)
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="000000000000e0b27905c57ebc58"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

--000000000000e0b27905c57ebc58
Content-Type: text/plain; charset="UTF-8"

Hello,

Requesting feedback on the new design of I/O Enclosure Settings screens in
the WebUI:
https://github.com/openbmc/webui-vue/issues/67

Regards
*Parishrut Bhatia*
User Experience Designer | IBM iX, Bangalore
+91 9811 930 069

*"Everyone wants to go to heaven, but no one wants to die."*

--000000000000e0b27905c57ebc58
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello,</div><div><br></div><div>Requesting feedback o=
n the new design of I/O Enclosure Settings screens in the WebUI:</div><div>=
<a href=3D"https://github.com/openbmc/webui-vue/issues/67">https://github.c=
om/openbmc/webui-vue/issues/67</a></div><div><br></div><div>Regards<br></di=
v><div><div dir=3D"ltr" class=3D"gmail_signature" data-smartmail=3D"gmail_s=
ignature"><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div dir=3D"ltr"><div=
><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><span style=3D"backgrou=
nd-color:rgb(255,255,255)"><font style=3D"font-size:12.72px" face=3D"tahoma=
, sans-serif"><b>Parishrut Bhatia</b></font></span><div style=3D"font-size:=
12.72px"><span style=3D"color:rgb(102,102,102)"><span style=3D"background-c=
olor:rgb(255,255,255)"><span style=3D"font-family:tahoma,sans-serif;font-si=
ze:small">User Experience Designer | IBM iX, Bangalore</span></span></span>=
</div><div style=3D"font-size:12.72px"><span style=3D"color:rgb(102,102,102=
)"><span style=3D"background-color:rgb(255,255,255)"><span style=3D"font-fa=
mily:tahoma,sans-serif;font-size:12.72px">+91 9811 930 069</span></span></s=
pan></div><div style=3D"font-size:12.72px"><span style=3D"background-color:=
rgb(255,255,255)"><br></span></div><div style=3D"font-size:12.72px"><i><spa=
n style=3D"color:rgb(102,102,102)"><span style=3D"background-color:rgb(255,=
255,255)">&quot;Everyone wants to go to heaven, but no one wants to die.&qu=
ot;</span></span></i><br></div><div style=3D"font-size:12.72px"><br><br></d=
iv></div></div></div></div></div></div></div></div></div></div></div></div>

--000000000000e0b27905c57ebc58--
