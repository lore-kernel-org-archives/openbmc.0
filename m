Return-Path: <39crpWwsJBxg426GGCByHCF4Ay69.0CACD2BzA096GHG.CN9yzG.CF4@trix.bounces.google.com>
Authentication-Results: lists.ozlabs.org; spf=pass (mailfrom)
 smtp.mailfrom=trix.bounces.google.com (client-ip=2607:f8b0:4864:20::d47;
 helo=mail-io1-xd47.google.com;
 envelope-from=39crpwwsjbxg426ggcbyhcf4ay69.0cacd2bza096ghg.cn9yzg.cf4@trix.bounces.google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="UhyF+910"; 
 dkim-atps=neutral
Received: from mail-io1-xd47.google.com (mail-io1-xd47.google.com
 [IPv6:2607:f8b0:4864:20::d47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42v0Bz70RBzF3F5
 for <openbmc@lists.ozlabs.org>; Tue, 13 Nov 2018 05:48:23 +1100 (AEDT)
Received: by mail-io1-xd47.google.com with SMTP id v23-v6so10529906ioh.16
 for <openbmc@lists.ozlabs.org>; Mon, 12 Nov 2018 10:48:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:reply-to:message-id:date:subject:from:to;
 bh=dUFrlw9b2Z5YGkbERfmsI4Qo8Re6/dkEAoNCfhUCizI=;
 b=UhyF+910dkltqgyITLwHp4pb16/a/FqXfrU8YXMfR48lt2ffvPV7DsYd2aPEdCBmj6
 uj77xmZgYZBJMipxd3cJT6J7hwN6S0ZHSnm1TFQpOWzu940ysur/ABBqJ8j03j78oggB
 uKpoDJamqHMF5M8qyGBQSnlJLE066ByVh3HKteoZWxm/VVXvqqSqhLmqui7rNITlHo8f
 zZc68qOeV0VXQDpiM3wsqWkbFxPCz/r8KAs0t9UTNnUuCIBw2l8Q648DTNzHRSBmoQ65
 BPxkJCf3TDsrHnHpp9Au+jEEWiY581nZIbu/+LbbZZEh+S8pWStLaxi03jaO9nmv5Dep
 dpbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:reply-to:message-id:date:subject
 :from:to;
 bh=dUFrlw9b2Z5YGkbERfmsI4Qo8Re6/dkEAoNCfhUCizI=;
 b=eMqziSTqPMpI7fjRFCkbLAsrD3YpzC6ocgs/mo3VgdfFrc9ZrakA9x3GnV20wjTMlf
 W3JPM6LylLewhlT3ykgHeaDMPHuLXj2GYjzlX6D3RpgUSH2dAVaPqV86kwSO42DDgA00
 iyuOu54whTFK0jgfXU6LtCGCrbeyYYhZzFoQQrCySliy8SK9s68/pxJLnawDJmNS4NcL
 YRUWLWVvBNNYh6pC995QOOvZibc/tZD0e0qv0d5mJnSHqke0QSweRMgiHKdmgWD0F2d/
 RkKVnGvnDgVo0EgNDZg5CxwVYfHNBq6ePLLchyU27XiseEFnkYH7R4l8TU4ia3Ybq0zd
 tx2w==
X-Gm-Message-State: AGRZ1gIAjAFuUOBdMXuSZC7SLGupvDI0JP9CXoifwrQglqGiBiRn/x1x
 1Z2plJiANzkbPPiwAg72mBZdPIxy7zdGalG4gR2d
X-Google-Smtp-Source: AJdET5ewBNfyXMHQDgEYpLZnJ3BqbVKdTeSHc69xhX6fQxQsXW8hqwEUJ6IIMkurrc7Nfdjld/LjCt+hynz5sbp8Kdkj
MIME-Version: 1.0
X-Received: by 2002:a5e:cb4c:: with SMTP id
 h12-v6mr1542566iok.13.1542048501787; 
 Mon, 12 Nov 2018 10:48:21 -0800 (PST)
Reply-To: geissonator@gmail.com
X-No-Auto-Attachment: 1
Message-ID: <0000000000002cf60d057a7c257b@google.com>
Date: Mon, 12 Nov 2018 18:48:21 +0000
Subject: OpenBMC Infrastructure Workgroup Meeting Time
From: geissonator@gmail.com
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="0000000000002cf5f7057a7c2578"
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
X-List-Received-Date: Mon, 12 Nov 2018 18:48:29 -0000

--0000000000002cf5f7057a7c2578
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes

I've invited you to fill out the following form:
OpenBMC Infrastructure Workgroup Meeting Time

To fill it out, visit:
https://docs.google.com/forms/d/e/1FAIpQLScxwDVD9zUr_pHhpFWr1gLL2lxfsHzR31-A9ClHcMG0O1XzWw/viewform?vc=0&amp;c=0&amp;w=1&amp;usp=mail_form_link

I&#39;ve invited you to fill out a form:

Google Forms: Create and analyze surveys.

--0000000000002cf5f7057a7c2578
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
 href=3D"https://docs.google.com/forms/d/e/1FAIpQLScxwDVD9zUr_pHhpFWr1gLL2l=
xfsHzR31-A9ClHcMG0O1XzWw/viewform?vc=3D0&amp;c=3D0&amp;w=3D1&amp;usp=3Dmail=
_form_link" style=3D"border-radius: 3px; box-sizing: border-box; display: i=
nline-block; font-size: 13px; font-weight: 700; height: 40px; line-height: =
40px; padding: 0 24px; text-align: center; text-decoration: none; text-tran=
sform: uppercase; vertical-align: middle; color: #fff; background-color: rg=
b(103,58,183);" target=3D"_blank" rel=3D"noopener">Fill out in Google Forms=
</a></td></tr></tbody></table></td></tr><tr height=3D"24px"><td></td></tr><=
/tbody></table><div align=3D"center" style=3D"background-color: #fff; borde=
r-bottom: 1px solid #e0e0e0; margin: 0 auto; max-width: 624px; min-width: 1=
54px; padding: 0 24px;"><table align=3D"center" cellpadding=3D"0" cellspaci=
ng=3D"0" style=3D"background-color: #fff;" width=3D"100%" role=3D"presentat=
ion"><tbody><tr height=3D"24px"><td></td></tr><tr><td><span style=3D"displa=
y: table-cell; vertical-align: top; font-size: 13px; line-height: 18px; col=
or: #424242;" dir=3D"auto">I&#39;ve invited you to fill out a form:</span><=
/td></tr><tr height=3D"20px"><td></tr><tr style=3D"font-size: 20px; line-he=
ight: 24px;"><td dir=3D"auto"><a href=3D"https://docs.google.com/forms/d/e/=
1FAIpQLScxwDVD9zUr_pHhpFWr1gLL2lxfsHzR31-A9ClHcMG0O1XzWw/viewform?vc=3D0&am=
p;c=3D0&amp;w=3D1&amp;usp=3Dmail_form_link" style=3D"color: rgb(103,58,183)=
; text-decoration: none; vertical-align: middle; font-weight: 500">OpenBMC =
Infrastructure Workgroup Meeting Time</a><div itemprop=3D"action" itemscope=
 itemtype=3D"http://schema.org/ViewAction"><meta itemprop=3D"url" content=
=3D"https://docs.google.com/forms/d/e/1FAIpQLScxwDVD9zUr_pHhpFWr1gLL2lxfsHz=
R31-A9ClHcMG0O1XzWw/viewform?vc=3D0&amp;c=3D0&amp;w=3D1&amp;usp=3Dmail_goto=
_form"><meta itemprop=3D"name" content=3D"Fill out form"></div></td></tr><t=
r height=3D"16px"></tr><tr><td style=3D"display: table-cell; vertical-align=
: top; font-size: 13px; line-height: 18px; color: #424242;" dir=3D"auto">Pe=
r mailing list email https://lists.ozlabs.org/pipermail/openbmc/2018-Octobe=
r/013867.html, I&#39;d like to find an optimal time for people to attend th=
e new OpenBMC Infrastructure workgroup.<br><br>My thinking is it&#39;ll be =
every other week for 60 minutes.</td></tr><tr height=3D"24px"></tr><tr><td>=
<div class=3D"ss-form" style=3D""><form action=3D"https://docs.google.com/f=
orms/u/0/d/e/1FAIpQLScxwDVD9zUr_pHhpFWr1gLL2lxfsHzR31-A9ClHcMG0O1XzWw/formR=
esponse" method=3D"POST" id=3D"ss-form" target=3D"_self" style=3D""><ol rol=
e=3D"list" class=3D"ss-question-list" style=3D"padding-left: 0;list-style-t=
ype:none;">

<div class=3D"ss-form-question errorbox-good" role=3D"listitem" style=3D"">
<div dir=3D"auto" class=3D"ss-item  ss-radio" style=3D"margin:12px 0;"><div=
 class=3D"ss-form-entry" style=3D"margin-bottom:1.5em;vertical-align:middle=
;margin-left:0;margin-top:0;max-width:100%;">
<label class=3D"ss-q-item-label" for=3D"entry_491496655" style=3D""><div cl=
ass=3D"ss-q-title" style=3D"display:block;font-weight:bold;margin-top:.83em=
;margin-bottom:.83em;">When would you like to meet for this meeting?
</div>
<div class=3D"ss-q-help ss-secondary-text" dir=3D"auto" style=3D"display:bl=
ock;margin:.1em 0 .25em 0;color:#666;"></div></label>


<ul class=3D"ss-choices" role=3D"radiogroup" aria-label=3D"When would you l=
ike to meet for this meeting?  " style=3D"list-style:none;padding:0;margin:=
.5em 0 0;"><li class=3D"ss-choice-item" style=3D"margin:0;line-height:1.3em=
;padding-bottom:.5em;">
<label><span class=3D"ss-choice-item-control goog-inline-block" style=3D"po=
sition:relative;display:inline-block;"><input type=3D"radio" name=3D"entry.=
1535382555" value=3D"The opposite week of the test workgroup, Thursday, 10-=
11am Central" id=3D"group_1535382555_1" role=3D"radio" class=3D"ss-q-radio"=
 aria-label=3D"The opposite week of the test workgroup, Thursday, 10-11am C=
entral" style=3D""></span>
<span class=3D"ss-choice-label" style=3D"">The opposite week of the test wo=
rkgroup, Thursday, 10-11am Central</span>
</label></li> <li class=3D"ss-choice-item" style=3D"margin:0;line-height:1.=
3em;padding-bottom:.5em;">
<label><span class=3D"ss-choice-item-control goog-inline-block" style=3D"po=
sition:relative;display:inline-block;"><input type=3D"radio" name=3D"entry.=
1535382555" value=3D"The opposite week of the release workgroup, Monday, 3-=
4pm Central" id=3D"group_1535382555_2" role=3D"radio" class=3D"ss-q-radio" =
aria-label=3D"The opposite week of the release workgroup, Monday, 3-4pm Cen=
tral" style=3D""></span>
<span class=3D"ss-choice-label" style=3D"">The opposite week of the release=
 workgroup, Monday, 3-4pm Central</span>
</label></li> <li class=3D"ss-choice-item" style=3D"margin:0;line-height:1.=
3em;padding-bottom:.5em;">
<label><span class=3D"ss-choice-item-control goog-inline-block" style=3D"po=
sition:relative;display:inline-block;"><input type=3D"radio" name=3D"entry.=
1535382555" value=3D"I&#39;m good with either time" id=3D"group_1535382555_=
3" role=3D"radio" class=3D"ss-q-radio" aria-label=3D"I&#39;m good with eith=
er time" style=3D""></span>
<span class=3D"ss-choice-label" style=3D"">I&#39;m good with either time</s=
pan>
</label></li> <li class=3D"ss-choice-item" style=3D"margin:0;line-height:1.=
3em;padding-bottom:.5em;"><label><span class=3D"ss-choice-item-control goog=
-inline-block" style=3D"position:relative;display:inline-block;"><input typ=
e=3D"radio" name=3D"entry.1535382555" value=3D"__other_option__" id=3D"grou=
p_1535382555_4" role=3D"radio" class=3D"ss-q-radio ss-q-other-toggle" style=
=3D""></span>
<span class=3D"ss-choice-label" style=3D"">Other:</span></label>
<span class=3D"ss-q-other-container goog-inline-block" style=3D"position:re=
lative;display:inline-block;"><input type=3D"text" name=3D"entry.1535382555=
.other_option_response" value=3D"" class=3D"ss-q-other" id=3D"entry_1535382=
555_other_option_response" dir=3D"auto" aria-label=3D"Other" style=3D""></s=
pan>
</li></ul>

</div></div></div>
<input type=3D"hidden" name=3D"draftResponse" value=3D"[null,null,&quot;457=
9137645565616483&quot;]
" style=3D"">
<input type=3D"hidden" name=3D"pageHistory" value=3D"0" style=3D"">

<input type=3D"hidden" name=3D"usp" value=3D"mail_form_submit" style=3D"">

<input type=3D"hidden" name=3D"fbzx" value=3D"4579137645565616483" style=3D=
"">

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
<a href=3D"https://docs.google.com/forms/u/0/d/e/1FAIpQLScxwDVD9zUr_pHhpFWr=
1gLL2lxfsHzR31-A9ClHcMG0O1XzWw/reportabuse?source=3Dhttps://docs.google.com=
/forms/d/e/1FAIpQLScxwDVD9zUr_pHhpFWr1gLL2lxfsHzR31-A9ClHcMG0O1XzWw/viewfor=
m?sid%3D399b1c58ca308467%26vc%3D0%26c%3D0%26w%3D1%26token%3DBXJoCWcBAAA.iMn=
sR-9rfL1s3wkbbzKWgw.uNcmIwIYJ38rLd32aFhFgA" style=3D"">Report Abuse</a>
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
--0000000000002cf5f7057a7c2578--
