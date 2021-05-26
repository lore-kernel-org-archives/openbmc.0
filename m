Return-Path: <SRS0=dbb7=KV=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57D42C47082
	for <openbmc@archiver.kernel.org>; Wed, 26 May 2021 14:46:51 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B37BC610C7
	for <openbmc@archiver.kernel.org>; Wed, 26 May 2021 14:46:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B37BC610C7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fqv0n1vp7z2yy9
	for <openbmc@archiver.kernel.org>; Thu, 27 May 2021 00:46:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=EAZT5u4u;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102b;
 helo=mail-pj1-x102b.google.com; envelope-from=parishrutb@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=EAZT5u4u; dkim-atps=neutral
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [IPv6:2607:f8b0:4864:20::102b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fqv0M3Fb9z2y0D
 for <openbmc@lists.ozlabs.org>; Thu, 27 May 2021 00:46:26 +1000 (AEST)
Received: by mail-pj1-x102b.google.com with SMTP id
 n6-20020a17090ac686b029015d2f7aeea8so463587pjt.1
 for <openbmc@lists.ozlabs.org>; Wed, 26 May 2021 07:46:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=4fNz1Ic9eaSB0TZDVm0dI29W8pvOwxHY6j1KEPfh1f0=;
 b=EAZT5u4usRfV6yWhZCsPIYtGvF84BvW4fvaVPY4TdWM8CD/QD5jcwDCo48979MIrRj
 jy86viTVuVHszQDqgzuQ9dyqkrNELKfw55ARnF1q4D4XXAHFaKef8DORJBVdW1hQHJkY
 j73UDLDaEUViXUFaTIn1L7n82FBej4P8BHWNP2Hy9PKrC2P7HTmC/no5+G2twIZa3EYJ
 3XGuDDpSAIJtBzL6Gy0vON4fMs4uOkx/7DnRCYeTmhopyFa+SUhglSGB4hzxqvd+GF6W
 DWwpmfEc8Qeom+RuqYYInqPecFQz8w3y8tIAzFBO3aI8WIx9/sRTIBIAq/SEwn3taFTJ
 ABwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=4fNz1Ic9eaSB0TZDVm0dI29W8pvOwxHY6j1KEPfh1f0=;
 b=cr5Tyii5qCkqpUNih95eT6cJue6WoIwafks0N/rKbq4sjNx4AYo/pQot5WmGLN41z+
 OOdH8AI+QvCUWRes5edQ5fyec99UoHpOObFNUm3QyURxNL+chL+muhP8et7NSlNnHgHD
 Y2Y3Ls2T6wWUsUDiQUGczpqtCavn82qGyYLJpxE5ozx/blc2uaHdHNI22P5nrhVoh9V4
 bWOj2oqauRcTtt8kWMlQtuB4ViXiU916LaE0HKN9Lqpv2vbS9ITxOlfs/DIW1IQ9VOwt
 YeNak6D5je4TaCq3UC4e1asVMgHE99HdwHn6/8zynzLvoUuVi5LYy8pZ2R/p1UUSKpWw
 1K0A==
X-Gm-Message-State: AOAM533sXMEcQ3l3N/Sq3mB5l1Fmc9BF/2aNFBkuFNIPd9kv7hyT0KfV
 F4iq0fVUMVhUVEhko7pxU9qsRtw7qoZFS6PLIgvVK/dfQIM=
X-Google-Smtp-Source: ABdhPJzFEvunp37uIEbANZGGEEopDSpGlge1DkbA42r4nsJcvaR30Sj4svQDuHK2S2PFDTIygiHZOEuBfuwlvbK028A=
X-Received: by 2002:a17:90a:6f06:: with SMTP id
 d6mr36570059pjk.216.1622040382859; 
 Wed, 26 May 2021 07:46:22 -0700 (PDT)
MIME-Version: 1.0
From: Parishrut Bhatia <parishrutb@gmail.com>
Date: Wed, 26 May 2021 20:16:11 +0530
Message-ID: <CA+FKyEVTpR+Lr3yr97MPYgWEJhs_sziW1yx5jQvcGTYmKrQiEw@mail.gmail.com>
Subject: Requesting feedback on in-progress GUI designs (POST code logs,
 real-time indicators)
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="000000000000d4ed5a05c33cb49f"
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

--000000000000d4ed5a05c33cb49f
Content-Type: text/plain; charset="UTF-8"

Hello,

Requesting feedback on the current iteration of new Firmware Update screens
in the WebUI:
https://github.com/openbmc/webui-vue/issues/62

Thanks a lot in advance!

*Parishrut Bhatia*
User Experience Designer | IBM iX, Bangalore
+91 9811 930 069

*"Everyone wants to go to heaven, but no one wants to die."*

--000000000000d4ed5a05c33cb49f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div>Hello,</div><div><br></div><div>Requesting feedb=
ack on the current iteration of new Firmware Update screens in the WebUI:</=
div><div><a href=3D"https://github.com/openbmc/webui-vue/issues/62">https:/=
/github.com/openbmc/webui-vue/issues/62</a></div><div><br></div><div dir=3D=
"ltr"><span style=3D"color:rgb(0,0,0)">Thanks a lot in advance!<br></span><=
/div></div><div><br></div><div><div dir=3D"ltr" class=3D"gmail_signature" d=
ata-smartmail=3D"gmail_signature"><div dir=3D"ltr"><div><div dir=3D"ltr"><d=
iv><div dir=3D"ltr"><div><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"=
><span style=3D"background-color:rgb(255,255,255)"><font style=3D"font-size=
:12.72px" face=3D"tahoma, sans-serif"><b>Parishrut Bhatia</b></font></span>=
<div style=3D"font-size:12.72px"><span style=3D"color:rgb(102,102,102)"><sp=
an style=3D"background-color:rgb(255,255,255)"><span style=3D"font-family:t=
ahoma,sans-serif;font-size:small">User Experience Designer | IBM iX, Bangal=
ore</span></span></span></div><div style=3D"font-size:12.72px"><span style=
=3D"color:rgb(102,102,102)"><span style=3D"background-color:rgb(255,255,255=
)"><span style=3D"font-family:tahoma,sans-serif;font-size:12.72px">+91 9811=
 930 069</span></span></span></div><div style=3D"font-size:12.72px"><span s=
tyle=3D"background-color:rgb(255,255,255)"><br></span></div><div style=3D"f=
ont-size:12.72px"><i><span style=3D"color:rgb(102,102,102)"><span style=3D"=
background-color:rgb(255,255,255)">&quot;Everyone wants to go to heaven, bu=
t no one wants to die.&quot;</span></span></i><br></div><div style=3D"font-=
size:12.72px"><br><br></div></div></div></div></div></div></div></div></div=
></div></div></div></div>

--000000000000d4ed5a05c33cb49f--
