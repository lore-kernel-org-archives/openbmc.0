Return-Path: <3tUYoWwoJB8Irium0.uqpuouiqt.kwuwxmvjuktq010.w7tij0.wzo@trix.bounces.google.com>
Authentication-Results: lists.ozlabs.org; spf=pass (mailfrom)
 smtp.mailfrom=trix.bounces.google.com (client-ip=2607:f8b0:4001:c06::245;
 helo=mail-io0-x245.google.com;
 envelope-from=3tuyowwojb8irium0.uqpuouiqt.kwuwxmvjuktq010.w7tij0.wzo@trix.bounces.google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="EUINQzpu"; 
 dkim-atps=neutral
Received: from mail-io0-x245.google.com (mail-io0-x245.google.com
 [IPv6:2607:f8b0:4001:c06::245])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 418p0Z6s9GzDrcd
 for <openbmc@lists.ozlabs.org>; Tue, 19 Jun 2018 09:56:39 +1000 (AEST)
Received: by mail-io0-x245.google.com with SMTP id 140-v6so14718944iou.14
 for <openbmc@lists.ozlabs.org>; Mon, 18 Jun 2018 16:56:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:reply-to:message-id:date:subject:from:to;
 bh=h2UKY0p7BI1LJ2bDU+AH/P2ZrMFadP1nwhJPvwUx0rc=;
 b=EUINQzpurrKs49RvGiBTOoucxH0yAWa2RLpFtQWgRBRlx7o73A8D46f1dC2ZO+2P4E
 CdyqCtwtUuPMF2gKxkQjkj4bkrFZRW5/lImFT9QPVrG1sKqfSQPbU2kkzsSnkImj7Vj9
 /Dbepa5Z5L1owFC+wiNUaprXTlENZDzlXekCcQ2c6xM4Evg7hQ9OeKqZu8FCTOj2sgo9
 mqBJfXLlJrTRYo5NEDVxTH/CGL/N0mRSpz4rPGEpJV5oqHJfrA01MxbEl96jwd2Jhwck
 qCo7/InD1GYOgIAgFok3pyKbCm52vVlY5y01aEGDd+azVsMtc50BKeeBHEaUU91m9/VQ
 vAmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:reply-to:message-id:date:subject
 :from:to;
 bh=h2UKY0p7BI1LJ2bDU+AH/P2ZrMFadP1nwhJPvwUx0rc=;
 b=kvZrW37sU1z2WU1sS+/IDZVQFNjcQ+TTEWzU+C1jhFN99hRDkfS5QU66Y7To4TKppr
 0qcIOxmS9SO7TuESXB/sYz3JNu1ucbDWRYznaNxJ8MgGakPjnwNMSXYBvnpJzG4ZkGK7
 RcWS56sAJkgfqVvK2n+wQkn1W7oZfGVJ/xqrM9yR1jiFaUBqcx6yd5McvR6f8+q7NH4F
 02JthM0rHuc5vzcFNCnlD20+jisWpn67JpUEx7YFyNPNYTnuIIFiCplInCq229Q3xe7F
 kUGPif0V0JoBM9NazmYJxlh5ZYB9GjCfyrKRa01pdsFARBuVjFcONviBY4Bm3eb+5tdY
 FR4w==
X-Gm-Message-State: APt69E3AftJe0g76xjYCZi5m6E85AxwRWr6dhZ0pPpe/L6VabLaNLQPi
 QvmOGaVKYEroD3xMOMr4zONqxEyTPEpmbAIIZZLa
X-Google-Smtp-Source: ADUXVKJM00BlM03JLBydnNKtnnv2DC+ERqpqOj/Pr6l668eQQygzQN44J+sFsbVEhLpwRhZwHYQNuurpETmwHHOgW26c
MIME-Version: 1.0
X-Received: by 2002:a02:8cc1:: with SMTP id n1-v6mr6467994jal.12.1529366197285; 
 Mon, 18 Jun 2018 16:56:37 -0700 (PDT)
Reply-To: james.mihm@gmail.com
X-No-Auto-Attachment: 1
Message-ID: <000000000000ebc0ca056ef350df@google.com>
Date: Mon, 18 Jun 2018 23:56:37 +0000
Subject: Poll - Fall 2018 OpenBMC Hackathon 
From: james.mihm@gmail.com
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="000000000000ebc0b3056ef350dc"
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
X-List-Received-Date: Mon, 18 Jun 2018 23:56:47 -0000

--000000000000ebc0b3056ef350dc
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes

I've invited you to fill out the following form:
OpenBMC Hackathon

To fill it out, visit:
https://docs.google.com/forms/d/e/1FAIpQLSeGn5x4Y-6vgu3_AyY3YsIr_JVU5YCjLXufuXxdT9Qy6sz42Q/viewform?c=0&amp;w=1&amp;usp=mail_form_link

I&#39;ve invited you to fill out a form:

Google Forms: Create and analyze surveys.

--000000000000ebc0b3056ef350dc
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
;" dir=3D"auto">I&#39;ve invited you to fill out a form:</span></td></tr><t=
r height=3D"20px"><td></tr><tr style=3D"font-size: 20px; line-height: 24px;=
"><td dir=3D"auto"><a href=3D"https://docs.google.com/forms/d/e/1FAIpQLSeGn=
5x4Y-6vgu3_AyY3YsIr_JVU5YCjLXufuXxdT9Qy6sz42Q/viewform?c=3D0&amp;w=3D1&amp;=
usp=3Dmail_form_link" style=3D"color: rgb(103,58,183); text-decoration: non=
e; vertical-align: middle; font-weight: 500">OpenBMC Hackathon</a><div item=
prop=3D"action" itemscope itemtype=3D"http://schema.org/ViewAction"><meta i=
temprop=3D"url" content=3D"https://docs.google.com/forms/d/e/1FAIpQLSeGn5x4=
Y-6vgu3_AyY3YsIr_JVU5YCjLXufuXxdT9Qy6sz42Q/viewform?c=3D0&amp;w=3D1&amp;usp=
=3Dmail_goto_form"><meta itemprop=3D"name" content=3D"Fill out form"></div>=
</td></tr><tr height=3D"16px"></tr><tr><td style=3D"display: table-cell; ve=
rtical-align: top; font-size: 13px; line-height: 18px; color: #424242;" dir=
=3D"auto">A proposal was made to move the date of the Hackathon from Septem=
ber to October.<br><br>Soliciting input from the community for dates for th=
e Fall 2018 Hackathon sponsored by Intel in Hillsboro, Oregon, USA.<br><br>=
The response deadline is Thursday, June  21st, 2018 at 5pm (PST).</td></tr>=
<tr height=3D"24px"></tr><tr><td><div class=3D"ss-form" style=3D""><form ac=
tion=3D"https://docs.google.com/forms/u/0/d/e/1FAIpQLSeGn5x4Y-6vgu3_AyY3YsI=
r_JVU5YCjLXufuXxdT9Qy6sz42Q/formResponse" method=3D"POST" id=3D"ss-form" ta=
rget=3D"_self" style=3D""><ol role=3D"list" class=3D"ss-question-list" styl=
e=3D"padding-left: 0;list-style-type:none;">

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
55965231" value=3D"October 8th - 11th, 2018" id=3D"group_55965231_2" role=
=3D"radio" class=3D"ss-q-radio" aria-label=3D"October 8th - 11th, 2018" sty=
le=3D""></span>
<span class=3D"ss-choice-label" style=3D"">October 8th - 11th, 2018</span>
</label></li></ul>

</div></div></div>
<input type=3D"hidden" name=3D"draftResponse" value=3D"[null,null,&quot;-67=
72237110067792330&quot;]
" style=3D"">
<input type=3D"hidden" name=3D"pageHistory" value=3D"0" style=3D"">

<input type=3D"hidden" name=3D"usp" value=3D"mail_form_submit" style=3D"">

<input type=3D"hidden" name=3D"fbzx" value=3D"-6772237110067792330" style=
=3D"">
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
--000000000000ebc0b3056ef350dc--
