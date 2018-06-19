Return-Path: <3oEcoWwoJB68YPbTh.bXWbVbPXa.RdbdeTcQbRaXhih.doaPQh.dgV@trix.bounces.google.com>
Authentication-Results: lists.ozlabs.org; spf=pass (mailfrom)
 smtp.mailfrom=trix.bounces.google.com (client-ip=2607:f8b0:4001:c06::247;
 helo=mail-io0-x247.google.com;
 envelope-from=3oecowwojb68ypbth.bxwbvbpxa.rdbdetcqbraxhih.doapqh.dgv@trix.bounces.google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="HSsOAkYv"; 
 dkim-atps=neutral
Received: from mail-io0-x247.google.com (mail-io0-x247.google.com
 [IPv6:2607:f8b0:4001:c06::247])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 418p552HfgzF0WP
 for <openbmc@lists.ozlabs.org>; Tue, 19 Jun 2018 10:00:34 +1000 (AEST)
Received: by mail-io0-x247.google.com with SMTP id v4-v6so14500538iol.8
 for <openbmc@lists.ozlabs.org>; Mon, 18 Jun 2018 17:00:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:reply-to:message-id:date:subject:from:to;
 bh=zsaj0t+6TDM/qHBKv+tvX+UKJucil4CPEXIGzi8pov0=;
 b=HSsOAkYvWTIG5vMgMCxfxzDYmsqUqcXKe15hRa3RxSYmBHCwNJztY4OW6YIpAmZUR0
 rEyHM6A487Z9WqMYYJqbdl0WVPPxd2FyokhUYtwgWxXgm+E7TQYfD50vjdjam5F90cqL
 4Q8BFJzFXgDANTcTqZss38AFRBMulWVYdrfCIGPVPz2zJmtOx8AWN2n53UHFyROpq5af
 dxiCNjEfkyfnogsMjb89xxI40I3FPh6z3+eCvV46XjO/dkxSFcir2NBs1QX8rcrAURGW
 nX7HnCuFPbLYznqoHyLHAihf6hUjezVrKfeX2rF0GeiIyhFyFx9LLfatg3AlTBUNYxpU
 m/1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:reply-to:message-id:date:subject
 :from:to;
 bh=zsaj0t+6TDM/qHBKv+tvX+UKJucil4CPEXIGzi8pov0=;
 b=S/fziGuwhBMU6VcaPePREOMYjmSi4Bb7V/H/0wS5upcZC2o1DFyzgv1IlrlILcnu/P
 9d45lUEdBi9LZQsQokPP+Iekr82wJ7FD49LYx7N0NtVRMRr7xm4HOr1eMy1JlDw8j9Qc
 jrqy8v3/n60fa0uAryOdEGA7I3quf3qT2oWD13RVDn0k7a/dJTaYsrD4kYu4aZtY8hLq
 03aNIfHgjRkeclLTAm8aL8bsVDY/fiASOJbnSDTIVQzz2U1pT4nZwhs1eI8BQ8p6oRN3
 3XV45K4SbimDFUd77P8UKqbIQc42F6zBf2l8I2ZYtNyGug7XvdPazJ7yZqXunLx5TEG2
 kDgQ==
X-Gm-Message-State: APt69E2rWwL4DpZQk/7aHlO5yoTZ0ucldip/ZuLN1f1y++ISj++CyaXW
 3WFm6ra2dXPxWdmYqZxxqftnkccHhjrqc7ciExxR
X-Google-Smtp-Source: ADUXVKJ7kGQohiLY71rO92SThLoIKGd60jNGE5ZZRmWo86U7Yuz5Rmsmh31BSfjCM0YycE6L5w32/Qw0qGdK5yiDQ084
MIME-Version: 1.0
X-Received: by 2002:a02:c5:: with SMTP id 188-v6mr6486059jaa.15.1529366432770; 
 Mon, 18 Jun 2018 17:00:32 -0700 (PDT)
Reply-To: james.mihm@gmail.com
X-No-Auto-Attachment: 1
Message-ID: <000000000000f4f3d0056ef35e6f@google.com>
Date: Tue, 19 Jun 2018 00:00:32 +0000
Subject: OpenBMC Hackathon
From: james.mihm@gmail.com
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="000000000000f4f3c1056ef35e6c"
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
X-List-Received-Date: Tue, 19 Jun 2018 00:00:44 -0000

--000000000000f4f3c1056ef35e6c
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes

I've invited you to fill out the following form:
OpenBMC Hackathon

To fill it out, visit:
https://docs.google.com/forms/d/e/1FAIpQLSeGn5x4Y-6vgu3_AyY3YsIr_JVU5YCjLXufuXxdT9Qy6sz42Q/viewform?c=0&amp;w=1&amp;usp=mail_form_link

Corrected the date for October to 9th - 11th.

I&#39;ve invited you to fill out a form:

Google Forms: Create and analyze surveys.

--000000000000f4f3c1056ef35e6c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<html><body style=3D"font-family: Roboto,Helvetica,Arial,sans-serif; margin=
: 0; padding: 0; height: 100%; width: 100%;"><table border=3D"0" cellpaddin=
g=3D"0" cellspacing=3D"0" style=3D"background-color:rgb(103,58,183);" width=
=3D"100%" role=3D"presentation"><tbody><tr height=3D"64px"><td style=3D"pad=
ding-left: 24px"><img alt=3D"Google Forms" height=3D"26px" style=3D"display=
: inline-block; margin: 0; vertical-align: middle;" width=3D"143px" src=3D"=
https://www.gstatic.com/docs/forms/google_forms_logo_lockup_white_2x.png"><=
/td></tr></tbody></table><div style=3D"padding: 24px; background-color:rgb(=
237,231,246)"><table align=3D"center" border=3D"0" cellpadding=3D"0" cellsp=
acing=3D"0" style=3D"max-width: 672px; min-width: 154px;" width=3D"100%" ro=
le=3D"presentation"><tbody><tr><td style=3D"font-size: 13px; line-height: 1=
8px; color: #424242; font-weight: 700">Having trouble viewing or submitting=
 this form?</td></tr><tr height=3D"8px"><td></td></tr><tr><td><table border=
=3D"0" cellpadding=3D"0" cellspacing=3D"0" width=3D"100%"><tbody><tr><td><a=
 href=3D"https://docs.google.com/forms/d/e/1FAIpQLSeGn5x4Y-6vgu3_AyY3YsIr_J=
VU5YCjLXufuXxdT9Qy6sz42Q/viewform?c=3D0&amp;w=3D1&amp;usp=3Dmail_form_link"=
 style=3D"border-radius: 3px; box-sizing: border-box; display: inline-block=
; font-size: 13px; font-weight: 700; height: 40px; line-height: 40px; paddi=
ng: 0 24px; text-align: center; text-decoration: none; text-transform: uppe=
rcase; vertical-align: middle; color: #fff; background-color: rgb(103,58,18=
3);" target=3D"_blank" rel=3D"noopener">Fill out in Google Forms</a></td></=
tr></tbody></table></td></tr><tr height=3D"24px"><td></td></tr></tbody></ta=
ble><div align=3D"center" style=3D"background-color: #fff; border-bottom: 1=
px solid #e0e0e0; margin: 0 auto; max-width: 624px; min-width: 154px; paddi=
ng: 0 24px;"><table align=3D"center" cellpadding=3D"0" cellspacing=3D"0" st=
yle=3D"background-color: #fff;" width=3D"100%" role=3D"presentation"><tbody=
><tr height=3D"24px"><td></td></tr><tr><td><span style=3D"display: table-ce=
ll; vertical-align: top; font-size: 13px; line-height: 18px; color: #424242=
;" dir=3D"auto">Corrected the date for October to 9th - 11th.<br><br>I&#39;=
ve invited you to fill out a form:</span></td></tr><tr height=3D"20px"><td>=
</tr><tr style=3D"font-size: 20px; line-height: 24px;"><td dir=3D"auto"><a =
href=3D"https://docs.google.com/forms/d/e/1FAIpQLSeGn5x4Y-6vgu3_AyY3YsIr_JV=
U5YCjLXufuXxdT9Qy6sz42Q/viewform?c=3D0&amp;w=3D1&amp;usp=3Dmail_form_link" =
style=3D"color: rgb(103,58,183); text-decoration: none; vertical-align: mid=
dle; font-weight: 500">OpenBMC Hackathon</a><div itemprop=3D"action" itemsc=
ope itemtype=3D"http://schema.org/ViewAction"><meta itemprop=3D"url" conten=
t=3D"https://docs.google.com/forms/d/e/1FAIpQLSeGn5x4Y-6vgu3_AyY3YsIr_JVU5Y=
CjLXufuXxdT9Qy6sz42Q/viewform?c=3D0&amp;w=3D1&amp;usp=3Dmail_goto_form"><me=
ta itemprop=3D"name" content=3D"Fill out form"></div></td></tr><tr height=
=3D"16px"></tr><tr><td style=3D"display: table-cell; vertical-align: top; f=
ont-size: 13px; line-height: 18px; color: #424242;" dir=3D"auto">A proposal=
 was made to move the date of the Hackathon from September to October.<br><=
br>Soliciting input from the community for dates for the Fall 2018 Hackatho=
n sponsored by Intel in Hillsboro, Oregon, USA.<br><br>The response deadlin=
e is Thursday, June  21st, 2018 at 5pm (PST).</td></tr><tr height=3D"24px">=
</tr><tr><td><div class=3D"ss-form" style=3D""><form action=3D"https://docs=
.google.com/forms/u/0/d/e/1FAIpQLSeGn5x4Y-6vgu3_AyY3YsIr_JVU5YCjLXufuXxdT9Q=
y6sz42Q/formResponse" method=3D"POST" id=3D"ss-form" target=3D"_self" style=
=3D""><ol role=3D"list" class=3D"ss-question-list" style=3D"padding-left: 0=
;list-style-type:none;">

<div class=3D"ss-form-question errorbox-good" role=3D"listitem" style=3D"">
<div dir=3D"auto" class=3D"ss-item  ss-radio" style=3D"margin:12px 0;"><div=
 class=3D"ss-form-entry" style=3D"margin-bottom:1.5em;vertical-align:middle=
;margin-left:0;margin-top:0;max-width:100%;">
<label class=3D"ss-q-item-label" for=3D"entry_1602138391" style=3D""><div c=
lass=3D"ss-q-title" style=3D"display:block;font-weight:bold;margin-top:.83e=
m;margin-bottom:.83em;">Select preferred date for the Fall Hackathon
</div>
<div class=3D"ss-q-help ss-secondary-text" dir=3D"auto" style=3D"display:bl=
ock;margin:.1em 0 .25em 0;color:#666;"></div></label>


<ul class=3D"ss-choices" role=3D"radiogroup" aria-label=3D"Select preferred=
 date for the Fall Hackathon  " style=3D"list-style:none;padding:0;margin:.=
5em 0 0;"><li class=3D"ss-choice-item" style=3D"margin:0;line-height:1.3em;=
padding-bottom:.5em;">
<label><span class=3D"ss-choice-item-control goog-inline-block" style=3D"po=
sition:relative;display:inline-block;"><input type=3D"radio" name=3D"entry.=
55965231" value=3D"Sept 18th - 20th, 2018" id=3D"group_55965231_1" role=3D"=
radio" class=3D"ss-q-radio" aria-label=3D"Sept 18th - 20th, 2018" style=3D"=
"></span>
<span class=3D"ss-choice-label" style=3D"">Sept 18th - 20th, 2018</span>
</label></li> <li class=3D"ss-choice-item" style=3D"margin:0;line-height:1.=
3em;padding-bottom:.5em;">
<label><span class=3D"ss-choice-item-control goog-inline-block" style=3D"po=
sition:relative;display:inline-block;"><input type=3D"radio" name=3D"entry.=
55965231" value=3D"October 9th - 11th, 2018" id=3D"group_55965231_2" role=
=3D"radio" class=3D"ss-q-radio" aria-label=3D"October 9th - 11th, 2018" sty=
le=3D""></span>
<span class=3D"ss-choice-label" style=3D"">October 9th - 11th, 2018</span>
</label></li></ul>

</div></div></div>
<input type=3D"hidden" name=3D"draftResponse" value=3D"[null,null,&quot;136=
612974799437793&quot;]
" style=3D"">
<input type=3D"hidden" name=3D"pageHistory" value=3D"0" style=3D"">

<input type=3D"hidden" name=3D"usp" value=3D"mail_form_submit" style=3D"">

<input type=3D"hidden" name=3D"fbzx" value=3D"136612974799437793" style=3D"=
">
<div class=3D"ss-send-email-receipt" style=3D"margin-bottom: 4px;" dir=3D"l=
tr"><label for=3D"emailReceipt" style=3D"display:inline;"></label></div>
<div class=3D"ss-item ss-navigate" style=3D"margin:12px 0;"><table id=3D"na=
vigation-table" style=3D""><tbody><tr><td class=3D"ss-form-entry goog-inlin=
e-block" id=3D"navigation-buttons" dir=3D"ltr" style=3D"margin-bottom:1.5em=
;vertical-align:middle;margin-left:0;margin-top:0;max-width:100%;position:r=
elative;display:inline-block;">
<input type=3D"submit" name=3D"submit" value=3D"Submit" id=3D"ss-submit" cl=
ass=3D"jfk-button jfk-button-action " style=3D"">
</td>
</tr></tbody></table></div></ol></form></div>
<div class=3D"ss-footer" style=3D""><div class=3D"ss-attribution" style=3D"=
"></div>
<div class=3D"ss-legal" style=3D""><div class=3D"disclaimer-separator" styl=
e=3D""></div>
<div class=3D"disclaimer" dir=3D"ltr" style=3D""><div class=3D"powered-by-l=
ogo" style=3D"margin-top:2em;"><span class=3D"powered-by-text" style=3D"">P=
owered by</span>
<a href=3D"https://www.google.com/forms/about/?utm_source=3Dproduct&amp;utm=
_medium=3Dforms_logo&amp;utm_campaign=3Dforms" style=3D""><div class=3D"ss-=
logo-container" style=3D""><img src=3D"https://ssl.gstatic.com/docs/forms/f=
orms_logo_2_small_dark_2x.png" height=3D"21px" width=3D"108px" alt=3D"Googl=
e Forms" style=3D""></div></a></div>
<div class=3D"ss-terms" style=3D"color:#777;font-size:11px;margin-top:1.5em=
;"><span class=3D"disclaimer-msg" style=3D"">This content is neither create=
d nor endorsed by Google.</span>
<br>
<a href=3D"https://docs.google.com/forms/u/0/d/e/1FAIpQLSeGn5x4Y-6vgu3_AyY3=
YsIr_JVU5YCjLXufuXxdT9Qy6sz42Q/reportabuse?source=3Dhttps://docs.google.com=
/forms/d/e/1FAIpQLSeGn5x4Y-6vgu3_AyY3YsIr_JVU5YCjLXufuXxdT9Qy6sz42Q/viewfor=
m?sid%3Db22550cf7bb617b%26c%3D0%26w%3D1%26token%3Dfdt8FWQBAAA.7VcZNXAYxRSxq=
O04T7dvHg.WrfU1fSSMtuqHtsulT1asg" style=3D"">Report Abuse</a>
-
<a href=3D"http://www.google.com/accounts/TOS" style=3D"">Terms of Service<=
/a>
-
<a href=3D"http://www.google.com/google-d-s/terms.html" style=3D"">Addition=
al Terms</a></div></div></div></div>
</td></tr><tr height=3D"24px"></tr></tbody></table></div><table align=3D"ce=
nter" cellpadding=3D"0" cellspacing=3D"0" style=3D"max-width: 672px; min-wi=
dth: 154px;" width=3D"100%" role=3D"presentation"><tbody><tr height=3D"24px=
"><td></td></tr><tr><td><a href=3D"https://docs.google.com/forms?usp=3Dmail=
_form_link" style=3D"color: #424242; font-size: 13px;">Create your own Goog=
le Form</a></td></tr></tbody></table></div></body></html>
--000000000000f4f3c1056ef35e6c--
