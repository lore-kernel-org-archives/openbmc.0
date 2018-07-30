Return-Path: <3MqReWwgJB9UJ9M1JJII7D19C.3FDFG5E2D3C9JKJ.FQC12J.FI7@trix.bounces.google.com>
Authentication-Results: lists.ozlabs.org; spf=pass (mailfrom)
 smtp.mailfrom=trix.bounces.google.com (client-ip=2607:f8b0:4003:c06::246;
 helo=mail-oi0-x246.google.com;
 envelope-from=3mqrewwgjb9uj9m1jjii7d19c.3fdfg5e2d3c9jkj.fqc12j.fi7@trix.bounces.google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="JlhrUvyC"; 
 dkim-atps=neutral
Received: from mail-oi0-x246.google.com (mail-oi0-x246.google.com
 [IPv6:2607:f8b0:4003:c06::246])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41f7dR5963zF0gv
 for <openbmc@lists.ozlabs.org>; Mon, 30 Jul 2018 15:37:57 +1000 (AEST)
Received: by mail-oi0-x246.google.com with SMTP id j189-v6so9931605oih.11
 for <openbmc@lists.ozlabs.org>; Sun, 29 Jul 2018 22:37:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:reply-to:message-id:date:subject:from:to;
 bh=mLxynRRkzyFT2dJoBkbT/+XFCfS5Loixp3ORmTNDzlo=;
 b=JlhrUvyCyXMLwO/4Y8tA9o+cuJP0tVPPqY23VjOfbmAlQF/5DB9bl/xSodBt5PIbO9
 UtU1nDLz3OB3ed5LA/9dMx1+MXAqhXaudGzxp3q9gycBIRlw8HKHoPZCMs3ekfzwkVgQ
 YPZ+SAf6EEf4kxH+X5kI/G1e6obuK3PNMPawiaLce92ww/mSGNiJUQJHW3qnOBooDWfH
 OGpkj2KoEC2NI70uR7NyeyJ1n7qUk+O2646r1UUrDrsNaWfLjjeGpG9fXe0WZbBxwT6U
 GvxDmU9ZcmHSo1nrJDldXFNgOsTCIN0R4XuIO3JJFhEjimveUKuJOI+CcuXC5eOE6MQE
 ID3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:reply-to:message-id:date:subject
 :from:to;
 bh=mLxynRRkzyFT2dJoBkbT/+XFCfS5Loixp3ORmTNDzlo=;
 b=PZCiXumJC/u3zmg9Q75yM8jKTOhH8v5bJHQKyYVlZMssMYWTt5TDW0aB1D9ce/ptTj
 WCN1WRpQzid1iCC4pMJDBHZ7FPV9Y1n5kbQddAivNFdjOV9TkeAOog87A6Q3RwtP3fIQ
 q6bA4utBPcgNyBh9HdjDgwOPOTOEsot7TsUuQ2E54Oi6nIiExACDdyHVAEUfudNFJIfg
 41MbXr3LEu+eXlUZ0chhUDWjs9hVEPfo0FEiXJxxJ5hhQkCfNhn3XYGekB7EVeWMhgXS
 ZstXKmxm4xpm9/75HW/CmLpc7nokw/T33vIOPeJYp8tbj8vySxIBT8Tp7DTCMlm+HqTb
 uNLw==
X-Gm-Message-State: AOUpUlFJ4hv/+w3w49l6SBu0Pq8Dbu5hg3tr63GmHxxnajsAbb3T86QE
 L2E9ZCKEwACNZTCTicDLImxuQEBCzeCQBZwtBBim
X-Google-Smtp-Source: AAOMgpfs0i67aPq0eep9XeDcps2HkM1/2dGH6YCg2mAajtcsZI7FikXrKbWWwhtD3ak7qeRyQkOIuF+oNKQ+XktKJDTC
MIME-Version: 1.0
X-Received: by 2002:aca:a61d:: with SMTP id
 p29-v6mr10140309oie.56.1532929074720; 
 Sun, 29 Jul 2018 22:37:54 -0700 (PDT)
Reply-To: sivassrr@gmail.com
X-No-Auto-Attachment: 1
Message-ID: <000000000000f6f4ff057230dc8d@google.com>
Date: Mon, 30 Jul 2018 05:37:54 +0000
Subject: OpenBMC Test Work Group - Poll
From: sivassrr@gmail.com
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="000000000000f6f4e9057230dc8a"
X-Mailman-Approved-At: Tue, 31 Jul 2018 10:00:14 +1000
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
X-List-Received-Date: Mon, 30 Jul 2018 05:38:05 -0000

--000000000000f6f4e9057230dc8a
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes

I've invited you to fill out the following form:
OpenBMC Test Work Group

To fill it out, visit:
https://docs.google.com/forms/d/e/1FAIpQLScYu8fPprtqF2EvxWkL-_cLVHHu_FBFBtQ0dLtib3E68akv-A/viewform?c=0&amp;w=1&amp;usp=mail_form_link

I&#39;ve invited you to fill out a form:

Google Forms: Create and analyze surveys.

--000000000000f6f4e9057230dc8a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<html><body style=3D"font-family: Roboto,Helvetica,Arial,sans-serif; margin=
: 0; padding: 0; height: 100%; width: 100%;"><table border=3D"0" cellpaddin=
g=3D"0" cellspacing=3D"0" style=3D"background-color:rgb(76,175,80);" width=
=3D"100%" role=3D"presentation"><tbody><tr height=3D"64px"><td style=3D"pad=
ding-left: 24px"><img alt=3D"Google Forms" height=3D"26px" style=3D"display=
: inline-block; margin: 0; vertical-align: middle;" width=3D"143px" src=3D"=
https://www.gstatic.com/docs/forms/google_forms_logo_lockup_white_2x.png"><=
/td></tr></tbody></table><div style=3D"padding: 24px; background-color:rgb(=
228,243,229)"><table align=3D"center" border=3D"0" cellpadding=3D"0" cellsp=
acing=3D"0" style=3D"max-width: 672px; min-width: 154px;" width=3D"100%" ro=
le=3D"presentation"><tbody><tr><td style=3D"font-size: 13px; line-height: 1=
8px; color: #424242; font-weight: 700">Having trouble viewing or submitting=
 this form?</td></tr><tr height=3D"8px"><td></td></tr><tr><td><table border=
=3D"0" cellpadding=3D"0" cellspacing=3D"0" width=3D"100%"><tbody><tr><td><a=
 href=3D"https://docs.google.com/forms/d/e/1FAIpQLScYu8fPprtqF2EvxWkL-_cLVH=
Hu_FBFBtQ0dLtib3E68akv-A/viewform?c=3D0&amp;w=3D1&amp;usp=3Dmail_form_link"=
 style=3D"border-radius: 3px; box-sizing: border-box; display: inline-block=
; font-size: 13px; font-weight: 700; height: 40px; line-height: 40px; paddi=
ng: 0 24px; text-align: center; text-decoration: none; text-transform: uppe=
rcase; vertical-align: middle; color: #fff; background-color: rgb(76,175,80=
);" target=3D"_blank" rel=3D"noopener">Fill out in Google Forms</a></td></t=
r></tbody></table></td></tr><tr height=3D"24px"><td></td></tr></tbody></tab=
le><div align=3D"center" style=3D"background-color: #fff; border-bottom: 1p=
x solid #e0e0e0; margin: 0 auto; max-width: 624px; min-width: 154px; paddin=
g: 0 24px;"><table align=3D"center" cellpadding=3D"0" cellspacing=3D"0" sty=
le=3D"background-color: #fff;" width=3D"100%" role=3D"presentation"><tbody>=
<tr height=3D"24px"><td></td></tr><tr><td><span style=3D"display: table-cel=
l; vertical-align: top; font-size: 13px; line-height: 18px; color: #424242;=
" dir=3D"auto">I&#39;ve invited you to fill out a form:</span></td></tr><tr=
 height=3D"20px"><td></tr><tr style=3D"font-size: 20px; line-height: 24px;"=
><td dir=3D"auto"><a href=3D"https://docs.google.com/forms/d/e/1FAIpQLScYu8=
fPprtqF2EvxWkL-_cLVHHu_FBFBtQ0dLtib3E68akv-A/viewform?c=3D0&amp;w=3D1&amp;u=
sp=3Dmail_form_link" style=3D"color: rgb(76,175,80); text-decoration: none;=
 vertical-align: middle; font-weight: 500">OpenBMC Test Work Group</a><div =
itemprop=3D"action" itemscope itemtype=3D"http://schema.org/ViewAction"><me=
ta itemprop=3D"url" content=3D"https://docs.google.com/forms/d/e/1FAIpQLScY=
u8fPprtqF2EvxWkL-_cLVHHu_FBFBtQ0dLtib3E68akv-A/viewform?c=3D0&amp;w=3D1&amp=
;usp=3Dmail_goto_form"><meta itemprop=3D"name" content=3D"Fill out form"></=
div></td></tr><tr height=3D"24px"></tr><tr><td><div class=3D"ss-form" style=
=3D""><form action=3D"https://docs.google.com/forms/u/0/d/e/1FAIpQLScYu8fPp=
rtqF2EvxWkL-_cLVHHu_FBFBtQ0dLtib3E68akv-A/formResponse" method=3D"POST" id=
=3D"ss-form" target=3D"_self" style=3D""><ol role=3D"list" class=3D"ss-ques=
tion-list" style=3D"padding-left: 0;list-style-type:none;">
<div class=3D"ss-form-question errorbox-good" role=3D"listitem" style=3D"">
<div dir=3D"auto" class=3D"ss-item ss-item-required ss-text" style=3D"margi=
n:12px 0;"><div class=3D"ss-form-entry" style=3D"margin-bottom:1.5em;vertic=
al-align:middle;margin-left:0;margin-top:0;max-width:100%;"><label class=3D=
"ss-q-item-label" for=3D"emailAddress" style=3D""><div class=3D"ss-q-title"=
 style=3D"display:block;font-weight:bold;margin-top:.83em;margin-bottom:.83=
em;">Email address
<label for=3D"emailAddress" aria-label=3D"(Required field)" style=3D""></la=
bel>
<span class=3D"ss-required-asterisk" aria-hidden=3D"true" style=3D"color:#c=
43b1d;">*</span></div></label>
<input type=3D"email" name=3D"emailAddress" value=3D"" class=3D"ss-q-short =
ss-printable-text-line" id=3D"emailAddress" dir=3D"auto" aria-label=3D"Must=
 be a valid email address" title=3D"Must be a valid email address" aria-req=
uired=3D"true" style=3D"">


</div></div></div>
<div class=3D"ss-form-question errorbox-good" role=3D"listitem" style=3D"">
<div dir=3D"auto" class=3D"ss-item ss-item-required ss-radio" style=3D"marg=
in:12px 0;"><div class=3D"ss-form-entry" style=3D"margin-bottom:1.5em;verti=
cal-align:middle;margin-left:0;margin-top:0;max-width:100%;">
<label class=3D"ss-q-item-label" for=3D"entry_1735297442" style=3D""><div c=
lass=3D"ss-q-title" style=3D"display:block;font-weight:bold;margin-top:.83e=
m;margin-bottom:.83em;">Test work group on alternate week - When Release pl=
anning meeting  not happen
<label for=3D"itemView.getDomIdToLabel()" aria-label=3D"(Required field)" s=
tyle=3D""></label>
<span class=3D"ss-required-asterisk" aria-hidden=3D"true" style=3D"color:#c=
43b1d;">*</span></div>
<div class=3D"ss-q-help ss-secondary-text" dir=3D"auto" style=3D"display:bl=
ock;margin:.1em 0 .25em 0;color:#666;"></div></label>


<ul class=3D"ss-choices" role=3D"radiogroup" aria-label=3D"Test work group =
on alternate week - When Release planning meeting  not happen  " style=3D"l=
ist-style:none;padding:0;margin:.5em 0 0;"><li class=3D"ss-choice-item" sty=
le=3D"margin:0;line-height:1.3em;padding-bottom:.5em;">
<label><span class=3D"ss-choice-item-control goog-inline-block" style=3D"po=
sition:relative;display:inline-block;"><input type=3D"radio" name=3D"entry.=
1790442977" value=3D"Yes" id=3D"group_1790442977_1" role=3D"radio" class=3D=
"ss-q-radio" aria-label=3D"Yes" aria-required=3D"true" style=3D""></span>
<span class=3D"ss-choice-label" style=3D"">Yes</span>
</label></li> <li class=3D"ss-choice-item" style=3D"margin:0;line-height:1.=
3em;padding-bottom:.5em;">
<label><span class=3D"ss-choice-item-control goog-inline-block" style=3D"po=
sition:relative;display:inline-block;"><input type=3D"radio" name=3D"entry.=
1790442977" value=3D"No" id=3D"group_1790442977_2" role=3D"radio" class=3D"=
ss-q-radio" aria-label=3D"No" aria-required=3D"true" style=3D""></span>
<span class=3D"ss-choice-label" style=3D"">No</span>
</label></li> <li class=3D"ss-choice-item" style=3D"margin:0;line-height:1.=
3em;padding-bottom:.5em;"><label><span class=3D"ss-choice-item-control goog=
-inline-block" style=3D"position:relative;display:inline-block;"><input typ=
e=3D"radio" name=3D"entry.1790442977" value=3D"__other_option__" id=3D"grou=
p_1790442977_3" role=3D"radio" class=3D"ss-q-radio ss-q-other-toggle" aria-=
required=3D"true" style=3D""></span>
<span class=3D"ss-choice-label" style=3D"">Other:</span></label>
<span class=3D"ss-q-other-container goog-inline-block" style=3D"position:re=
lative;display:inline-block;"><input type=3D"text" name=3D"entry.1790442977=
.other_option_response" value=3D"" class=3D"ss-q-other" id=3D"entry_1790442=
977_other_option_response" dir=3D"auto" aria-label=3D"Other" style=3D""></s=
pan>
</li></ul>

</div></div></div> <div class=3D"ss-form-question errorbox-good" role=3D"li=
stitem" style=3D"">
<div dir=3D"auto" class=3D"ss-item ss-item-required ss-text" style=3D"margi=
n:12px 0;"><div class=3D"ss-form-entry" style=3D"margin-bottom:1.5em;vertic=
al-align:middle;margin-left:0;margin-top:0;max-width:100%;">
<label class=3D"ss-q-item-label" for=3D"entry_964411639" style=3D""><div cl=
ass=3D"ss-q-title" style=3D"display:block;font-weight:bold;margin-top:.83em=
;margin-bottom:.83em;">Let know what do you think on your pain Areas to tes=
t - For eg. new kernel, security
<label for=3D"itemView.getDomIdToLabel()" aria-label=3D"(Required field)" s=
tyle=3D""></label>
<span class=3D"ss-required-asterisk" aria-hidden=3D"true" style=3D"color:#c=
43b1d;">*</span></div>
<div class=3D"ss-q-help ss-secondary-text" dir=3D"auto" style=3D"display:bl=
ock;margin:.1em 0 .25em 0;color:#666;"></div></label>

<input type=3D"text" name=3D"entry.964411639" value=3D"" class=3D"ss-q-shor=
t" id=3D"entry_964411639" dir=3D"auto" aria-label=3D"Let know what do you t=
hink on your pain Areas to test - For eg. new kernel, security  " aria-requ=
ired=3D"true" title=3D"" style=3D"">


</div></div></div> <div class=3D"ss-form-question errorbox-good" role=3D"li=
stitem" style=3D"">
<div dir=3D"auto" class=3D"ss-item  ss-radio" style=3D"margin:12px 0;"><div=
 class=3D"ss-form-entry" style=3D"margin-bottom:1.5em;vertical-align:middle=
;margin-left:0;margin-top:0;max-width:100%;">
<label class=3D"ss-q-item-label" for=3D"entry_263639323" style=3D""><div cl=
ass=3D"ss-q-title" style=3D"display:block;font-weight:bold;margin-top:.83em=
;margin-bottom:.83em;">Are you interested in joining this work group
</div>
<div class=3D"ss-q-help ss-secondary-text" dir=3D"auto" style=3D"display:bl=
ock;margin:.1em 0 .25em 0;color:#666;"></div></label>


<ul class=3D"ss-choices" role=3D"radiogroup" aria-label=3D"Are you interest=
ed in joining this work group  " style=3D"list-style:none;padding:0;margin:=
.5em 0 0;"><li class=3D"ss-choice-item" style=3D"margin:0;line-height:1.3em=
;padding-bottom:.5em;">
<label><span class=3D"ss-choice-item-control goog-inline-block" style=3D"po=
sition:relative;display:inline-block;"><input type=3D"radio" name=3D"entry.=
1097482677" value=3D"Yes" id=3D"group_1097482677_1" role=3D"radio" class=3D=
"ss-q-radio" aria-label=3D"Yes" style=3D""></span>
<span class=3D"ss-choice-label" style=3D"">Yes</span>
</label></li> <li class=3D"ss-choice-item" style=3D"margin:0;line-height:1.=
3em;padding-bottom:.5em;">
<label><span class=3D"ss-choice-item-control goog-inline-block" style=3D"po=
sition:relative;display:inline-block;"><input type=3D"radio" name=3D"entry.=
1097482677" value=3D"No" id=3D"group_1097482677_2" role=3D"radio" class=3D"=
ss-q-radio" aria-label=3D"No" style=3D""></span>
<span class=3D"ss-choice-label" style=3D"">No</span>
</label></li> <li class=3D"ss-choice-item" style=3D"margin:0;line-height:1.=
3em;padding-bottom:.5em;">
<label><span class=3D"ss-choice-item-control goog-inline-block" style=3D"po=
sition:relative;display:inline-block;"><input type=3D"radio" name=3D"entry.=
1097482677" value=3D"Maybe" id=3D"group_1097482677_3" role=3D"radio" class=
=3D"ss-q-radio" aria-label=3D"Maybe" style=3D""></span>
<span class=3D"ss-choice-label" style=3D"">Maybe</span>
</label></li></ul>

</div></div></div>
<input type=3D"hidden" name=3D"draftResponse" value=3D"[null,null,&quot;-42=
00902023403319068&quot;]
" style=3D"">
<input type=3D"hidden" name=3D"pageHistory" value=3D"0" style=3D"">

<input type=3D"hidden" name=3D"usp" value=3D"mail_form_submit" style=3D"">

<input type=3D"hidden" name=3D"fbzx" value=3D"-4200902023403319068" style=
=3D"">

<div class=3D"ss-item ss-navigate" style=3D"margin:12px 0;"><table id=3D"na=
vigation-table" style=3D""><tbody><tr><td class=3D"ss-form-entry goog-inlin=
e-block" id=3D"navigation-buttons" dir=3D"ltr" style=3D"margin-bottom:1.5em=
;vertical-align:middle;margin-left:0;margin-top:0;max-width:100%;position:r=
elative;display:inline-block;">
<input type=3D"submit" name=3D"submit" value=3D"Submit" id=3D"ss-submit" cl=
ass=3D"jfk-button jfk-button-action " style=3D"">
<div class=3D"ss-password-warning ss-secondary-text" style=3D"color:#666;">=
Never submit passwords through Google Forms.</div></td>
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
<a href=3D"https://docs.google.com/forms/u/0/d/e/1FAIpQLScYu8fPprtqF2EvxWkL=
-_cLVHHu_FBFBtQ0dLtib3E68akv-A/reportabuse?source=3Dhttps://docs.google.com=
/forms/d/e/1FAIpQLScYu8fPprtqF2EvxWkL-_cLVHHu_FBFBtQ0dLtib3E68akv-A/viewfor=
m?sid%3Dc2c8f0d919ab695%26c%3D0%26w%3D1%26token%3D13Dl6WQBAAA.HaU80mr5PMEZt=
eeu2aspzg.X88G8FAMZJAKT25bQ0a2_A" style=3D"">Report Abuse</a>
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
--000000000000f6f4e9057230dc8a--
