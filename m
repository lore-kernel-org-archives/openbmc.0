Return-Path: <3nbw2WwoJB9A5w80E.843828w47.yA8AB09x8y74EFE.AL7wxE.AD2@trix.bounces.google.com>
Authentication-Results: lists.ozlabs.org; spf=pass (mailfrom)
 smtp.mailfrom=trix.bounces.google.com (client-ip=2607:f8b0:4001:c0b::246;
 helo=mail-it0-x246.google.com;
 envelope-from=3nbw2wwojb9a5w80e.843828w47.ya8ab09x8y74efe.al7wxe.ad2@trix.bounces.google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="lUvfjw3o"; 
 dkim-atps=neutral
Received: from mail-it0-x246.google.com (mail-it0-x246.google.com
 [IPv6:2607:f8b0:4001:c0b::246])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41HXTJ6P4wzF31G
 for <openbmc@lists.ozlabs.org>; Sat, 30 Jun 2018 09:11:28 +1000 (AEST)
Received: by mail-it0-x246.google.com with SMTP id k129-v6so3083287itg.8
 for <openbmc@lists.ozlabs.org>; Fri, 29 Jun 2018 16:11:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:reply-to:message-id:date:subject:from:to;
 bh=f0niQeqx0De3NrzjdDlW73OGnABLn1ibyX0X+ZuDBEg=;
 b=lUvfjw3o7B16Corsc5/yBOipFeuHVlgFovsd/pFLed9LRi0eXfZ1awlEs36Vq5W911
 cG7hvwfHM2o38YB3szWGcpYrlpt+cD9lsrrwuJiyXkZ9BY3by/SvPc4hNwqmJ2Ow3ZM0
 6BUomzuzU9SU74kZR7yrGg0xUsWB/cgo3iiZM1OjhAAtVEA2UKbnOvEvJtcv4TC4yNlT
 KMKrIlrHfYRun+og6dpzVt++E4hGQIVuM+4M77gdq0RDWAJLLLGs3qA88kWqph9WPKov
 KPoQiuOVBjYymzTmaTCB/46w2YLnAqTsssB8IBzHr/78A2SpCMfmuvb6rtcU0iFTV8zb
 U8bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:reply-to:message-id:date:subject
 :from:to;
 bh=f0niQeqx0De3NrzjdDlW73OGnABLn1ibyX0X+ZuDBEg=;
 b=XwSR7JSiOfXaAPUgzdHAvXoI6R1L9/B9C2EF0b3HfwJz0GOpxmKzrbiW9/5vhMPoaA
 EcUkYdHahp6GnAIarg3+VJNX5uU73FGnV5V/lHxdII4B2/3VBSYZjewl682W0izyKJ0X
 CSXGttw0ySU2WMHiibIAyZCkEcq9siar4srSbID1OxqwrZ0KnmKrwadmZ81gpgbyV8GW
 nMn+c7fqpw/R7Cw7lEZgik18+1H32Hcftosp8nmo+S6PBbX1n+KPxuXwsDg6V+4nHX5t
 Tdmv/fako1mP7vkZ4N+qy9vpu6G7CqVD6Bea2mjjWHnWfjlweW5Iyn03Yqm3zOO+ffTy
 z0Ng==
X-Gm-Message-State: APt69E3BqxE3AsjVUqEb3BnvefGbcVqdvBI9vPv/ZRWpjveeMiVJBm9b
 UsV/Q82jonEDb2dMuVapvxj9M7SGFpSR5Opkst3c
X-Google-Smtp-Source: AAOMgpcVnerKIqSDJ2xTZ2Fl/omBbWgEEM1zkCxF1mRaaL74X439/EdgRDKo1kcAF6Oul/mEVpaeK5LayPKYbLPAMMP6
MIME-Version: 1.0
X-Received: by 2002:a6b:294f:: with SMTP id
 p76-v6mr5940824iop.93.1530313885900; 
 Fri, 29 Jun 2018 16:11:25 -0700 (PDT)
Reply-To: james.mihm@gmail.com
X-No-Auto-Attachment: 1
Message-ID: <000000000000906645056fcff7af@google.com>
Date: Fri, 29 Jun 2018 23:11:25 +0000
Subject: OpenBMC Hackathon Registration - Oct 9th - 11th, 2018
From: james.mihm@gmail.com
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="000000000000906622056fcff7ac"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 29 Jun 2018 23:11:34 -0000

--000000000000906622056fcff7ac
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes

I've invited you to fill out the following form:
OpenBMC Hackathon Registration

To fill it out, visit:
https://docs.google.com/forms/d/e/1FAIpQLSdhtVwaX3a4LjkwrQkb3dJLAxEReCDLar8LqJAxnryMsmkRTQ/viewform?c=0&amp;w=1&amp;usp=mail_form_link

I&#39;ve invited you to fill out an event registration form:

Google Forms: Create and analyze surveys.

--000000000000906622056fcff7ac
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
r: #424242;" dir=3D"auto">I&#39;ve invited you to fill out an event registr=
ation form:</span></td></tr><tr height=3D"20px"><td></tr><tr style=3D"font-=
size: 20px; line-height: 24px;"><td dir=3D"auto"><a href=3D"https://docs.go=
ogle.com/forms/d/e/1FAIpQLSdhtVwaX3a4LjkwrQkb3dJLAxEReCDLar8LqJAxnryMsmkRTQ=
/viewform?c=3D0&amp;w=3D1&amp;usp=3Dmail_form_link" style=3D"color: rgb(66,=
133,244); text-decoration: none; vertical-align: middle; font-weight: 500">=
OpenBMC Hackathon Registration</a><div itemprop=3D"action" itemscope itemty=
pe=3D"http://schema.org/ViewAction"><meta itemprop=3D"url" content=3D"https=
://docs.google.com/forms/d/e/1FAIpQLSdhtVwaX3a4LjkwrQkb3dJLAxEReCDLar8LqJAx=
nryMsmkRTQ/viewform?c=3D0&amp;w=3D1&amp;usp=3Dmail_goto_form"><meta itempro=
p=3D"name" content=3D"Fill out form"></div></td></tr><tr height=3D"16px"></=
tr><tr><td style=3D"display: table-cell; vertical-align: top; font-size: 13=
px; line-height: 18px; color: #424242;" dir=3D"auto">Event Date:  October 9=
th - 11th, 2018<br><br>Location:      Intel Corporation<br>                =
      Jones Farm Campus -- Building 5  (JF5)<br>                      2111 =
NE 25th Ave.<br>                      Hillsboro, Oregon   97124<br><br>    =
                  Entrance to JF5:  NE Jones Farm Parkway and NE 15th Ave.,=
 Hillsboro, OR  97124<br>                                                  =
   https://goo.gl/maps/RL9mMQw8n1R2<br><br>You are cordially invited to the=
 second OpenBMC Hackathon sponsored by Intel in Hillsboro, Oregon, USA.<br>=
<br>This is an opportunity for the awesome members of the OpenBMC community=
 to meet each other, work on code, brainstorm, solve problems, and network.=
<br><br>Seating is limited due to space constraints. Please register early =
to receive your confirmation email.<br><br>Registration Closes:  September =
28th at 5pm (PST), or when capacity is met.<br></td></tr><tr height=3D"24px=
"></tr><tr><td><table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" widt=
h=3D"100%"><tbody><tr><td><a href=3D"https://docs.google.com/forms/d/e/1FAI=
pQLSdhtVwaX3a4LjkwrQkb3dJLAxEReCDLar8LqJAxnryMsmkRTQ/viewform?c=3D0&amp;w=
=3D1&amp;usp=3Dmail_form_link" style=3D"border-radius: 3px; box-sizing: bor=
der-box; display: inline-block; font-size: 13px; font-weight: 700; height: =
40px; line-height: 40px; padding: 0 24px; text-align: center; text-decorati=
on: none; text-transform: uppercase; vertical-align: middle; color: #000; b=
ackground-color: rgb(66,133,244);" target=3D"_blank" rel=3D"noopener">Fill =
out form</a></td></tr></tbody></table></td></tr><tr height=3D"24px"></tr></=
tbody></table></div><table align=3D"center" cellpadding=3D"0" cellspacing=
=3D"0" style=3D"max-width: 672px; min-width: 154px;" width=3D"100%" role=3D=
"presentation"><tbody><tr height=3D"24px"><td></td></tr><tr><td><a href=3D"=
https://docs.google.com/forms?usp=3Dmail_form_link" style=3D"color: #424242=
; font-size: 13px;">Create your own Google Form</a></td></tr></tbody></tabl=
e></div></body></html>
--000000000000906622056fcff7ac--
