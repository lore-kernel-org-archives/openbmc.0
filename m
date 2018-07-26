Return-Path: <3-BxZWwoJB3ceVhZn.hdchbhVdg.XjhjkZiWhXgdnon.jugVWn.jmb@trix.bounces.google.com>
Authentication-Results: lists.ozlabs.org; spf=pass (mailfrom)
 smtp.mailfrom=trix.bounces.google.com (client-ip=2607:f8b0:4001:c06::246;
 helo=mail-io0-x246.google.com;
 envelope-from=3-bxzwwojb3cevhzn.hdchbhvdg.xjhjkziwhxgdnon.jugvwn.jmb@trix.bounces.google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="SKH848fw"; 
 dkim-atps=neutral
Received: from mail-io0-x246.google.com (mail-io0-x246.google.com
 [IPv6:2607:f8b0:4001:c06::246])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41bYf94vp8zDqnG
 for <openbmc@lists.ozlabs.org>; Thu, 26 Jul 2018 10:59:38 +1000 (AEST)
Received: by mail-io0-x246.google.com with SMTP id j18-v6so23815iog.7
 for <openbmc@lists.ozlabs.org>; Wed, 25 Jul 2018 17:59:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:reply-to:message-id:date:subject:from:to;
 bh=KuA5yYjVG62VuVgEnZgjB9maWI0mNnKBfDaj29vqNcY=;
 b=SKH848fwBUEI8kxq7ubTmAY0V2KliydHxMHtdpRA42K/laCeQJkYXsuV71A6BBX2kc
 1Yg03UIa34IVImpRe8rMEjLrBeiPkFqlEASatPUsG6sE1CEUu2OFmT50uK2bbJCzO3c4
 m0ZxfGjKb5uTF4sN/ATr6YsBm4RtWvPbwy7qhZ9Ss2vykeUtDw3oSqv4ReertElXozob
 XOrvADIdIlzIqMsiDe4xHW+gYGzklPIVgAs+oR/iNBwG8d45rCKucPrsoJdzc4fdpOyC
 aORQQzg1r3LneqJE2YpE+6wWxsB6XMeqRTEydX1wXll5E7SvCHxIEQuaRv1OFV2c4Oe6
 1CMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:reply-to:message-id:date:subject
 :from:to;
 bh=KuA5yYjVG62VuVgEnZgjB9maWI0mNnKBfDaj29vqNcY=;
 b=tV4/lFQAbNdoSwn0IwdFiTJudTsckNqKZ3uB6WIPNtRXSuw6V2BimQwg0z5CefD32y
 VFia/YKvDAM0q/Sya8aWnmwv1ybJ0pnJEGXhgsIAAZDwhzwH0PPLtNBGQcNidCmT2f6o
 hbOJ/iIa5zveaINDZBqKffrd+xQVTH8PxS8deLL0W8vzDqM8CM5YTsT1FuP/PcwWBOQ6
 jxWJ3ww67l4k8WxIfZ1Fyj9Edsev50tl5wJlL2wa495oO2/IJELBeQ6VDFf/cENDBrlU
 ZnMK4h58/Gv2xHnGsj1YrZeJ9J5YmzvmiD9tykTbOA9K+Mvj6BkEFlT74p8EMQBo34jr
 tLLw==
X-Gm-Message-State: AOUpUlFYgf4PUPT42lnUyAxPhPZfeGcsA0Hsrr5eLJ13j+FsT13J4/Ef
 w7ueYZvuDIrgyDTD1GMWgsAzQJtHaQrbxI1rDVx6
X-Google-Smtp-Source: AAOMgpdifYz1DMmRqpHa0lIHCyr+qwMif7B6xEXlPWZBEIb2COPjXMtbSkRWuM6EQbeu6Sn16dLZrc4h+BNWXubH6TgC
MIME-Version: 1.0
X-Received: by 2002:a5e:d70c:: with SMTP id
 v12-v6mr9175921iom.63.1532566776156; 
 Wed, 25 Jul 2018 17:59:36 -0700 (PDT)
Reply-To: james.mihm@gmail.com
X-No-Auto-Attachment: 1
Message-ID: <000000000000499a3c0571dc8242@google.com>
Date: Thu, 26 Jul 2018 00:59:36 +0000
Subject: OpenBMC Hackathon Registration - Reminder Notice
From: james.mihm@gmail.com
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="000000000000499a220571dc823f"
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
X-List-Received-Date: Thu, 26 Jul 2018 00:59:48 -0000

--000000000000499a220571dc823f
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes

I've invited you to fill out the following form:
OpenBMC Hackathon Registration

To fill it out, visit:
https://docs.google.com/forms/d/e/1FAIpQLSdhtVwaX3a4LjkwrQkb3dJLAxEReCDLar8LqJAxnryMsmkRTQ/viewform?c=0&amp;w=1&amp;usp=mail_form_link

I&#39;m resending this invitation as a reminder of the OpenBMC Hackathon  
scheduled for October 9th - 11th at Intel in Hillsboro, Oregon.

If you haven&#39;t received a confirmation email, then you are not  
registered.

I&#39;ve invited you to fill out a registration form:

Google Forms: Create and analyze surveys.

--000000000000499a220571dc823f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<html><body style=3D"font-family: Roboto,Helvetica,Arial,sans-serif; margin=
: 0; padding: 0; height: 100%; width: 100%;"><table border=3D"0" cellpaddin=
g=3D"0" cellspacing=3D"0" style=3D"background-color:rgb(66,133,244);" width=
=3D"100%" role=3D"presentation"><tbody><tr height=3D"64px"><td style=3D"pad=
ding-left: 24px"><img alt=3D"Google Forms" height=3D"26px" style=3D"display=
: inline-block; margin: 0; vertical-align: middle;" width=3D"143px" src=3D"=
https://www.gstatic.com/docs/forms/google_forms_logo_lockup_black_2x.png"><=
/td></tr></tbody></table><div style=3D"padding: 24px; background-color:rgb(=
227,237,253)"><div align=3D"center" style=3D"background-color: #fff; border=
-bottom: 1px solid #e0e0e0; margin: 0 auto; max-width: 624px; min-width: 15=
4px; padding: 0 24px;"><table align=3D"center" cellpadding=3D"0" cellspacin=
g=3D"0" style=3D"background-color: #fff;" width=3D"100%" role=3D"presentati=
on"><tbody><tr height=3D"24px"><td></td></tr><tr><td><span style=3D"display=
: table-cell; vertical-align: top; font-size: 13px; line-height: 18px; colo=
r: #424242;" dir=3D"auto">I&#39;m resending this invitation as a reminder o=
f the OpenBMC Hackathon scheduled for October 9th - 11th at Intel in Hillsb=
oro, Oregon.<br><br>If you haven&#39;t received a confirmation email, then =
you are not registered.<br><br>I&#39;ve invited you to fill out a registrat=
ion form:</span></td></tr><tr height=3D"20px"><td></tr><tr style=3D"font-si=
ze: 20px; line-height: 24px;"><td dir=3D"auto"><a href=3D"https://docs.goog=
le.com/forms/d/e/1FAIpQLSdhtVwaX3a4LjkwrQkb3dJLAxEReCDLar8LqJAxnryMsmkRTQ/v=
iewform?c=3D0&amp;w=3D1&amp;usp=3Dmail_form_link" style=3D"color: rgb(66,13=
3,244); text-decoration: none; vertical-align: middle; font-weight: 500">Op=
enBMC Hackathon Registration</a><div itemprop=3D"action" itemscope itemtype=
=3D"http://schema.org/ViewAction"><meta itemprop=3D"url" content=3D"https:/=
/docs.google.com/forms/d/e/1FAIpQLSdhtVwaX3a4LjkwrQkb3dJLAxEReCDLar8LqJAxnr=
yMsmkRTQ/viewform?c=3D0&amp;w=3D1&amp;usp=3Dmail_goto_form"><meta itemprop=
=3D"name" content=3D"Fill out form"></div></td></tr><tr height=3D"16px"></t=
r><tr><td style=3D"display: table-cell; vertical-align: top; font-size: 13p=
x; line-height: 18px; color: #424242;" dir=3D"auto">Event Date:  October 9t=
h - 11th, 2018<br><br>Location:      Intel Corporation<br>                 =
     Jones Farm Campus -- Building 5  (JF5)<br>                      2111 N=
E 25th Ave.<br>                      Hillsboro, Oregon   97124<br><br>     =
                 Entrance to JF5:  NE Jones Farm Parkway and NE 15th Ave., =
Hillsboro, OR  97124<br>                                                   =
  https://goo.gl/maps/RL9mMQw8n1R2<br><br>You are cordially invited to the =
second OpenBMC Hackathon sponsored by Intel in Hillsboro, Oregon, USA.<br><=
br>This is an opportunity for the awesome members of the OpenBMC community =
to meet each other, work on code, brainstorm, solve problems, and network.<=
br><br>Seating is limited due to space constraints. Please register early t=
o receive your confirmation email.<br><br>Registration Closes:  September 2=
8th at 5pm (PST), or when capacity is met.<br></td></tr><tr height=3D"24px"=
></tr><tr><td><table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" width=
=3D"100%"><tbody><tr><td><a href=3D"https://docs.google.com/forms/d/e/1FAIp=
QLSdhtVwaX3a4LjkwrQkb3dJLAxEReCDLar8LqJAxnryMsmkRTQ/viewform?c=3D0&amp;w=3D=
1&amp;usp=3Dmail_form_link" style=3D"border-radius: 3px; box-sizing: border=
-box; display: inline-block; font-size: 13px; font-weight: 700; height: 40p=
x; line-height: 40px; padding: 0 24px; text-align: center; text-decoration:=
 none; text-transform: uppercase; vertical-align: middle; color: #000; back=
ground-color: rgb(66,133,244);" target=3D"_blank" rel=3D"noopener">Fill out=
 form</a></td></tr></tbody></table></td></tr><tr height=3D"24px"></tr></tbo=
dy></table></div><table align=3D"center" cellpadding=3D"0" cellspacing=3D"0=
" style=3D"max-width: 672px; min-width: 154px;" width=3D"100%" role=3D"pres=
entation"><tbody><tr height=3D"24px"><td></td></tr><tr><td><a href=3D"https=
://docs.google.com/forms?usp=3Dmail_form_link" style=3D"color: #424242; fon=
t-size: 13px;">Create your own Google Form</a></td></tr></tbody></table></d=
iv></body></html>
--000000000000499a220571dc823f--
