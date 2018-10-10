Return-Path: <3GiK-WwoJBzsgXjbp.jfejdjXfi.ZljlmbkYjZifpqp.lwiXYp.lod@doclist.bounces.google.com>
Authentication-Results: lists.ozlabs.org; spf=pass (mailfrom)
 smtp.mailfrom=doclist.bounces.google.com (client-ip=2607:f8b0:4864:20::147;
 helo=mail-it1-x147.google.com;
 envelope-from=3gik-wwojbzsgxjbp.jfejdjxfi.zljlmbkyjzifpqp.lwixyp.lod@doclist.bounces.google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="JzzNZtCi"; 
 dkim-atps=neutral
Received: from mail-it1-x147.google.com (mail-it1-x147.google.com
 [IPv6:2607:f8b0:4864:20::147])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42Vf332S7rzF1Pl
 for <openbmc@lists.ozlabs.org>; Thu, 11 Oct 2018 03:00:29 +1100 (AEDT)
Received: by mail-it1-x147.google.com with SMTP id k69-v6so6359328ite.9
 for <openbmc@lists.ozlabs.org>; Wed, 10 Oct 2018 09:00:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:reply-to:references:message-id:date:subject:from:to;
 bh=M3W8lf+7ZFQXxF9kXzjfm1ZwU3udq9/5fKGtJjgUO7o=;
 b=JzzNZtCiMAeUt1E4SBPxLyeNtDlLjQtpdpMqtQaxe1sj7iKyZvnuAYm8rQQKk9PLzI
 j0tJtcaq8/AQ6c1KJSuXXyA3AbVPVcpGJPIUhIToshrQa3OXzdXDGaTDecUmqahDMYov
 gjSFMXhaViK3kk8H/MLY0PDH8Il2edBAoPogOP5PakRklCSnycGGP+OqDmBq6bgIsbhc
 Jz3oF9MOF1Kg2IHbwI93iedtKFm8ctH94TqtTn2PprIh53XeBBc4fxV+MSevFVyjLsfV
 KbYyyeEL9jao1O+4tuS9ovQP40XaXPawSCGQDw5AXYGkmCjItpHWuYkaBXHbxgXHTA8w
 vgHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:reply-to:references:message-id:date
 :subject:from:to;
 bh=M3W8lf+7ZFQXxF9kXzjfm1ZwU3udq9/5fKGtJjgUO7o=;
 b=bbxyMvbkXcLZgJFnwWiuY9rHErraOjLzN4j4OkT3b5DuB+9BCeyQWb6voAr+pl9yjR
 YiiGYbXb4joPuPfaH+sg5Mmq+52Q25RjdQj2xHOpyrz6YGPNEsWAPr3dkm5ucSykoq/J
 Z/hu+ag/uL+xfyAqpKpHuCA6sJYm07dYiC4E7Lz9l70eTdRALWWlq6WezDGm+9gAvc6E
 ukludSFTuKl/o+YL3NArIiYYcr+d7REGbqv56HF3649BFIVtOHU/TeHvP0dx3gOUl5zn
 hoaY3zsAuWlTG6yLKoR1KkmZjn1SivBE201PwkFEGJZ49YUwhjcfmLFfPr7v2RHbDQYw
 F09g==
X-Gm-Message-State: ABuFfoh6W39OEMjeRXFRSSaULNUxXnjVjPL/kH07REnQx3fHp20VIs1z
 xxNYcxG9E76ju9RUy5tO5bodvr3j19s=
X-Google-Smtp-Source: ACcGV60Si0UhK/r45Hw0KpQ7BQrw7PQJdaqMh5Y6W1r4sAGaaku9NU0HvxIgGIRArY/bcPmkBfR7KzyTPyM=
MIME-Version: 1.0
X-Received: by 2002:a24:254a:: with SMTP id
 g71-v6mr1128219itg.33.1539187226878; 
 Wed, 10 Oct 2018 09:00:26 -0700 (PDT)
Reply-To: James Mihm <james.mihm@gmail.com>
X-No-Auto-Attachment: 1
References: <64c3fec3-584c-4373-b9ad-dfb235a6d2de@docs-share.google.com>
Message-ID: <000000000000e6ad030577e1f323@google.com>
Date: Wed, 10 Oct 2018 16:00:26 +0000
Subject: OpenBMC Hackathon
From: "James Mihm (via Google Drive)" <james.mihm@gmail.com>
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="000000000000e6ace00577e1f320"
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
X-List-Received-Date: Wed, 10 Oct 2018 16:01:05 -0000

--000000000000e6ace00577e1f320
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes

I've shared an item with you:

OpenBMC Hackathon
https://drive.google.com/drive/folders/1aF0cy9_jwJrFvytv2jp1pI3Rf-uXHACI?usp=sharing&ts=5bbe221a

It's not an attachment -- it's stored online. To open this item, just click  
the link above.

Here's a link to where the OpenBMC Hackathon presentations.

--000000000000e6ace00577e1f320
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<html><head></head><body><script type=3D"application/json" data-scope=3D"in=
boxmarkup" nonce=3D"PFViI7UmVLXV7VFPH68TmUjZeHc">{"publisher":{"api_key":"1=
e6ef4c2b3e67680225868caeb59b7ad","name":"Google Drive"},"api_version":"1.0"=
,"updates":{"snippets":[{"icon":"DESCRIPTION","message":"James Mihm : Here\=
u0027s a link to where the OpenBMC Hackathon presentations."}],"action":{"n=
ame":"Open","url":"https://drive.google.com/drive/folders/1aF0cy9_jwJrFvytv=
2jp1pI3Rf-uXHACI?usp\u003dsharing_eid\u0026ts\u003d5bbe221a"}},"entity":{"m=
ain_image_url":"https://ssl.gstatic.com/bt/C3341AA7A1A076756462EE2E5CD71C11=
/smartmail/bt_google_drive_1600dp_r2.png","external_key":"1aF0cy9_jwJrFvytv=
2jp1pI3Rf-uXHACI","avatar_image_url":"https://www.gstatic.com/bt/C3341AA7A1=
A076756462EE2E5CD71C11/smartmail/bt_google_drive_avatar_224dp_r1.png","subt=
itle":"shared by James Mihm","action":{"name":"Open","url":"https://drive.g=
oogle.com/drive/folders/1aF0cy9_jwJrFvytv2jp1pI3Rf-uXHACI"},"title":"OpenBM=
C Hackathon"}}</script><div style=3D"width: 100%; padding: 24px 0 16px 0; b=
ackground-color: #f5f5f5; text-align: center;"><div style=3D"display: inlin=
e-block; width: 90%; max-width: 680px;min-width: 280px; text-align: left; f=
ont-family: Roboto,Arial,Helvetica,sans-serif;"><div style=3D"height: 0px;"=
 dir=3D"ltr"></div><div style=3D"display: block; padding: 0 2px;"><div styl=
e=3D"display: block; background: #fff; height: 2px;"></div></div><div style=
=3D"border-left: 1px solid #f0f0f0; border-right: 1px solid #f0f0f0;"><div =
style=3D"padding: 24px 32px 24px 32px; background:#fff; border-right: 1px s=
olid #eaeaea; border-left: 1px solid #eaeaea;" dir=3D"ltr"><div style=3D"fo=
nt-size: 14px; line-height: 18px; color: #444;"><a href=3D"mailto:james.mih=
m@gmail.com" style=3D"color:inherit;text-decoration:none">james.mihm@gmail.=
com</a> has shared a link to the following folder:</div><div style=3D"heigh=
t: 10px;"></div><div style=3D"font-size: 18px; display: table;"><div style=
=3D"display: table-row; border-bottom: 4px solid #fff;"><span style=3D"disp=
lay: table-cell;"><div style=3D"height: 32px;"><img src=3D"https://ssl.gsta=
tic.com/docs/documents/share/images/services/folder-3.png" aria-label=3D"Fo=
lder" style=3D"vertical-align: middle; max-width: 24px;"/></div></span><spa=
n style=3D"display: table-cell; padding-left: 12px; word-break: break-word;=
"><a href=3D"https://drive.google.com/drive/folders/1aF0cy9_jwJrFvytv2jp1pI=
3Rf-uXHACI?usp=3Dsharing_eil&amp;ts=3D5bbe221a" style=3D"color: #3367d6; te=
xt-decoration: none; vertical-align: middle;">OpenBMC Hackathon</a><div ite=
mprop=3D"action" itemscope itemtype=3D"http://schema.org/ViewAction"><meta =
itemprop=3D"url" content=3D"https://drive.google.com/drive/folders/1aF0cy9_=
jwJrFvytv2jp1pI3Rf-uXHACI?usp=3Dsharing_eil&amp;ts=3D5bbe221a"></div></span=
></div></div><div style=3D"height: 16px;"></div><div style=3D"height: 1px; =
background-color: #eee;"></div><div style=3D"height: 24px;"></div><div styl=
e=3D"display: table-row;"><img style=3D"display: table-cell;" width=3D"50" =
src=3D"https://ssl.gstatic.com/s2/profiles/images/silhouette64.png" alt=3D"=
Unknown profile photo"><span style=3D"display: table-cell; vertical-align: =
top; padding-left: 16px; font-size: 13px; line-height: 18px; max-width: 496=
px; color: #262626;">Here&#39;s a link to where the OpenBMC Hackathon prese=
ntations.</span></div><div style=3D"height: 32px;"></div><div><a href=3D"ht=
tps://drive.google.com/drive/folders/1aF0cy9_jwJrFvytv2jp1pI3Rf-uXHACI?usp=
=3Dsharing_eip&amp;ts=3D5bbe221a" target=3D"_blank" style=3D"background-col=
or: #4d90fe; border: 1px solid #3079ed; border-radius: 2px; color: white; d=
isplay: inline-block; font-family: Roboto,Arial,Helvetica,sans-serif; font-=
size: 11px; font-weight: bold; height: 29px; line-height: 29px; min-width: =
54px; outline: 0px; padding: 0 8px; text-align: center; text-decoration: no=
ne">Open</a></div></div></div><table style=3D"width: 100%; border-collapse:=
 collapse;" role=3D"presentation"><tr><td style=3D"padding: 0px;"><table st=
yle=3D"border-collapse: collapse; width: 3px;" role=3D"presentation"><tr he=
ight=3D"1"><td width=3D"1" bgcolor=3D"#f0f0f0" style=3D"padding: 0px;"></td=
><td width=3D"1" bgcolor=3D"#eaeaea" style=3D"padding: 0px;"></td><td width=
=3D"1" bgcolor=3D"#e5e5e5" style=3D"padding: 0px;"></td></tr><tr height=3D"=
1"><td width=3D"1" bgcolor=3D"#f0f0f0" style=3D"padding: 0px;"></td><td wid=
th=3D"1" bgcolor=3D"#eaeaea" style=3D"padding: 0px;"></td><td width=3D"1" b=
gcolor=3D"#eaeaea" style=3D"padding: 0px;"></td></tr><tr height=3D"1"><td w=
idth=3D"1" bgcolor=3D"#f5f5f5" style=3D"padding: 0px;"></td><td width=3D"1"=
 bgcolor=3D"#f0f0f0" style=3D"padding: 0px;"></td><td width=3D"1" bgcolor=
=3D"#f0f0f0" style=3D"padding: 0px;"></td></tr></table></td><td style=3D"wi=
dth: 100%; padding: 0px;"><div style=3D"height: 1px; width: auto; border-to=
p: 1px solid #ddd; background:#eaeaea; border-bottom: 1px solid #f0f0f0;"><=
/div></td><td style=3D"padding: 0px;"><table style=3D"border-collapse: coll=
apse; width: 3px;" role=3D"presentation"><tr height=3D"1"><td width=3D"1" b=
gcolor=3D"#e5e5e5" style=3D"padding: 0px;"></td><td width=3D"1" bgcolor=3D"=
#eaeaea" style=3D"padding: 0px;"></td><td width=3D"1" bgcolor=3D"#f0f0f0" s=
tyle=3D"padding: 0px;"></td></tr><tr height=3D"1"><td width=3D"1" bgcolor=
=3D"#eaeaea" style=3D"padding: 0px;"></td><td width=3D"1" bgcolor=3D"#eaeae=
a" style=3D"padding: 0px;"></td><td width=3D"1" bgcolor=3D"#f0f0f0" style=
=3D"padding: 0px;"></td></tr><tr height=3D"1"><td width=3D"1" bgcolor=3D"#f=
0f0f0" style=3D"padding: 0px;"></td><td width=3D"1" bgcolor=3D"#f0f0f0" sty=
le=3D"padding: 0px;"></td><td width=3D"1" bgcolor=3D"#f5f5f5" style=3D"padd=
ing: 0px;"></td></tr></table></td></tr></table><table style=3D"padding: 14p=
x 10px 0 10px;" role=3D"presentation" dir=3D"ltr"><tr><td style=3D"width: 1=
00%; font-size:11px; font-family: Roboto,Arial,Helvetica,sans-serif; color:=
#646464; line-height: 20px; min-height: 40px; vertical-align: middle;">Goog=
le Drive: Have all your files within reach from any device. <br/>Google LLC=
, 1600 Amphitheatre Parkway, Mountain View, CA 94043, USA</td><td style=3D"=
padding-left: 20px; vertical-align: middle;"><a href=3D"https://drive.googl=
e.com" target=3D"_blank"><img src=3D"https://www.gstatic.com/images/brandin=
g/googlelogo/1x/googlelogo_tm_black54_color_96x40dp.png" width=3D"96" alt=
=3D"Logo for Google Drive" border=3D"0"></a></td></tr></table></div></div><=
/body></html>
--000000000000e6ace00577e1f320--
