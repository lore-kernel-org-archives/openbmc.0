Return-Path: <openbmc+bounces-1939-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22AEACD4F25
	for <openbmc@archiver.kernel.org>; Fri, 15 May 2026 14:06:21 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gH8BD6syQz2xpn;
	Sat, 16 May 2026 00:06:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=103.168.172.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1778853972;
	cv=none; b=hxoN/rxKb3GAHT87b2BXclfWZf+hMYllwcUejflCz8OO+e+OqyT0lQvXYL9yv9BI0AeY0/3pBgpTD2E2mMt0VC3L7zz5geSd4sXhzB7oyHwhvcqd3V1AtZUZVgI51e4Lk7uB+JkbhXy5jnn+pBgS/ypHnvuyipW/e6Q0iXNxmK0VSjktKH/wkiml+c5Q6WCwUlZcfQYfMsa/H8hj9uWLqTJIkOr5LEr+okariDraTwxm9d1uMi1sYwWf5wDR/zyiXiP5J2WtPFhEBU2RYO6zy++r0WAkcCzLTldj8ScPd9YiymbYVUIjvJC3FQyL8ogAOVcqLFWChxqFsBjFu+52XA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1778853972; c=relaxed/relaxed;
	bh=QjXCOrnHmf2TQPb0TyoFAIvCDCiQx16aTC4wAFm31G8=;
	h=Content-Type:From:Mime-Version:Subject:Date:Message-Id:References:
	 Cc:In-Reply-To:To; b=foQfk1gGpxlz5IIv48Ato7x09SNX88Wt/tosE7S7RnViYKw9IcNOBDGek3hPRMteJ48Lh3mNPHQ/HHHW+KnXp0YwnPhs4rNDK0iJq9q6x/8zArUl7T4M2oN/pj+ugrmL6256rilT7j4vcADpp4tcMer5dr9bUXWeyv6VlD+dfEd99xlu0kWLNwRk5hp1BP28ZwX6nFKEtT6KGvDNM2SfiQ4dmbBYUQW7b4QONIIK4bUNEjF18iLg2ALwJDIEktWs+hQ0NkLNOju1tgGxpqWKDmhm6bb/TPQaHo057M8U1fO4MQ2V+/YsRLIbFCZFWrM5r5FTQQlOKKzmbx8kbK6oYQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=stwcx.xyz; dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm2 header.b=YVwX2Scs; dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=QhYIjR0A; dkim-atps=neutral; spf=pass (client-ip=103.168.172.158; helo=fhigh-a7-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=lists.ozlabs.org) smtp.mailfrom=stwcx.xyz
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm2 header.b=YVwX2Scs;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=QhYIjR0A;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=stwcx.xyz (client-ip=103.168.172.158; helo=fhigh-a7-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=lists.ozlabs.org)
X-Greylist: delayed 577 seconds by postgrey-1.37 at boromir; Sat, 16 May 2026 00:06:09 AEST
Received: from fhigh-a7-smtp.messagingengine.com (fhigh-a7-smtp.messagingengine.com [103.168.172.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gH8B91j8Rz2xFl
	for <openbmc@lists.ozlabs.org>; Sat, 16 May 2026 00:06:09 +1000 (AEST)
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 3FC8C14000F5;
	Fri, 15 May 2026 09:56:28 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Fri, 15 May 2026 09:56:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1778853388;
	 x=1778939788; bh=QjXCOrnHmf2TQPb0TyoFAIvCDCiQx16aTC4wAFm31G8=; b=
	YVwX2Scso+23V75vh7oZpAGFQQ2xzbKyXfkGJ5kRzbYVROgG6Am4I9nhxzgbmZRF
	J3xdQxBTAWn2r4fXNyDdXwJgmrPaNdV2Smh6eX60SFpRFnzX6HH7db/x4s1F6rvj
	jZgAaUTmVZTnPfkKaTVfecNpj1HylYeDAVr4Iurs1ByZBA+VMODTcnMJfZZOzulM
	+e9Sh53RgzhK5FF5LuLj0n4/AofwEfMn0UKglre1Niw3HFKbcT1jEso173HDqb2o
	lqEC8xCcOcBhtRNKRQRux9w6ZwiSaHAUpfJZojnLRyK7Wl4c645OpxFC/b+O7n+O
	Xpgs7xC6T0k6+ntQxL/VsA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1778853388; x=
	1778939788; bh=QjXCOrnHmf2TQPb0TyoFAIvCDCiQx16aTC4wAFm31G8=; b=Q
	hYIjR0AYYh7hplOHpPN6EYlNHEBjAqxF4l6ua0yzRorT924RCUKuYKXHMM77aQUN
	sL4TK1mtUlMO3bGDU62G4D2NdVg0i+XnZ9XPoAy6zCjGgsOKh3HBi/EFizAk+koE
	Wjwys0JVA/8G1LXKJz8giNpCGQhlTVKUvTFwlb8Ko6hD7Ta+G2to/tb6Ugzc5BNW
	OC3Qq5vUc5VgLvMSL5GBuegei6SC91sLq5pkeCu4LNQr+dlqmVOJ7fIw0XxH6XmN
	tgc/njpK8YQbl4KppI3dXzpT//Wur8SUcB3J8X2c2jJzYdGbbSydCQXBrwXN7qIP
	Wz91w+GrAgeSnTR6fXbyQ==
X-ME-Sender: <xms:CyYHamBs5USbDIznHppBbTQpwdCsMWuW28jhHmMNgDHaKe4-tkM7JQ>
    <xme:CyYHamgEIXa2_Mww_P3DT9S3NKwYe-BUD_SD8T3DzxZUJDChOg5F1LsyO2dNT2OU2
    S-hsT3Qy8TDA0gBxMIgI65c_Tt2Vh8FiEzz80XhQBKANY6aTRE1NS4>
X-ME-Received: <xmr:CyYHanNGLWoNNNpBtXpkTmOOWvmKhFtWVUPGNWcsUcnNiM8FFp8X6thkG8v-RF4DmUBn>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgddufedtheekucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucgfrhhlucfvnfffucdljedtmdenucfjughrpegtgffhgg
    fufffkfhevjgfvofesrgejmherhhdtjeenucfhrhhomheprfgrthhrihgtkhcuhghilhhl
    ihgrmhhsuceophgrthhrihgtkhesshhtfigtgidrgiihiieqnecuggftrfgrthhtvghrnh
    epkeejtddvjeduleejteefjefhtdetffevhfevffekkeeikedtledvuedvffdtveelnecu
    vehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepphgrthhrih
    gtkhesshhtfigtgidrgiihiidpnhgspghrtghpthhtohepvddpmhhouggvpehsmhhtphho
    uhhtpdhrtghpthhtohepohhpvghnsghmtgeslhhishhtshdrohiilhgrsghsrdhorhhgpd
    hrtghpthhtohepshhhihhvrgdrshhhrghnkhgrrhdrkhesihhnthgvlhdrtghomh
X-ME-Proxy: <xmx:CyYHav6ZcLb45dvuUK5kmgUUefQftJSIU_DnE3KKES8hfTnlL19GBw>
    <xmx:CyYHat1COvzIh4cR0hMLyO2gtuxXPXjZpjsbu60yj_hkK-ie6un5zA>
    <xmx:CyYHaobxNKQmWoI8J0eiTZ3QmQNr7XxVMMk1TRR90u7j6osJFPNDzw>
    <xmx:CyYHatDspTLdSlZOPCwWBcmTfx5bKTK4ZoJraxPa1viG_ZppuQzFGA>
    <xmx:DCYHapYqSF80_Shq1tVCaASivFLy3qapJHKb66lytERZHCoSBlhWLFJb>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 15 May 2026 09:56:27 -0400 (EDT)
Content-Type: multipart/alternative; boundary=Apple-Mail-603FDCDA-90F3-49E5-A085-68B627C4866E
Content-Transfer-Encoding: 7bit
From: Patrick Williams <patrick@stwcx.xyz>
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
Mime-Version: 1.0 (1.0)
Subject: Re: Simultaneous Firmware update and get sensor reading failing 
Date: Fri, 15 May 2026 09:56:16 -0400
Message-Id: <0203B443-489F-4869-A125-7AE028741D63@stwcx.xyz>
References: <CY5PR11MB6137C593E2E9DA3BBAF5C24AAD072@CY5PR11MB6137.namprd11.prod.outlook.com>
Cc: openbmc@lists.ozlabs.org
In-Reply-To: <CY5PR11MB6137C593E2E9DA3BBAF5C24AAD072@CY5PR11MB6137.namprd11.prod.outlook.com>
To: Shiva Shankar K <shiva.shankar.k@intel.com>
X-Mailer: iPhone Mail (23E261)


--Apple-Mail-603FDCDA-90F3-49E5-A085-68B627C4866E
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

What is AMC?

Which code are you using for PLDM firmware update?  I believe there is an im=
plementation still in flight in Gerrit within pldmd.
=20
=E2=80=94 Patrick Williams

> On May 14, 2026, at 7:52=E2=80=AFPM, K, Shiva Shankar <shiva.shankar.k@int=
el.com> wrote:
>=20
> =EF=BB=BF
> Hi Team,
>=20
> I have been working on pldm firmware update and the pldm monitoring and co=
ntrol.=20
>=20
> Problem:
>=20
> I am performing AMC  firmware update  from bmc and then simultaneously req=
uesting sensor data from AMC using GetSensorReading command. Both the comman=
ds get stuck at BMC's end and neither command is sent to AMC after that.=20
>=20
> May I know whether we can pause get sensor reading?
> What's the ideal time interval between two getsensorreading command?=20
>=20
> And let me know if u any other suggestion to get rid of this issue.  It wo=
uld be great to hear from the OpenBMC.
> Regards,
> Shiva Shankar K.
>=20

--Apple-Mail-603FDCDA-90F3-49E5-A085-68B627C4866E
Content-Type: text/html;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html class=3D"apple-mail-supports-explicit-dark-mode"><head><meta http-equi=
v=3D"content-type" content=3D"text/html; charset=3Dutf-8"></head><body dir=3D=
"auto">What is AMC?<div><br></div><div>Which code are you using for PLDM fir=
mware update? &nbsp;I believe there is an implementation still in flight in G=
errit within pldmd.</div><div>&nbsp;</div><div><div dir=3D"ltr"><span style=3D=
"background-color: rgba(255, 255, 255, 0);">=E2=80=94 Patrick Williams</span=
></div><div dir=3D"ltr"><br><blockquote type=3D"cite">On May 14, 2026, at 7:=
52=E2=80=AFPM, K, Shiva Shankar &lt;shiva.shankar.k@intel.com&gt; wrote:<br>=
<br></blockquote></div><blockquote type=3D"cite"><div dir=3D"ltr">=EF=BB=BF

<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii">=



<div dir=3D"ltr" style=3D"font-family: Aptos, Aptos_MSFontService, -apple-sy=
stem, Roboto, Arial, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0=
, 0);">
Hi Team,</div>
<div dir=3D"ltr" style=3D"font-family: Aptos, Aptos_MSFontService, -apple-sy=
stem, Roboto, Arial, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0=
, 0);">
<br>
</div>
<div dir=3D"ltr" style=3D"font-family: Aptos, Aptos_MSFontService, -apple-sy=
stem, Roboto, Arial, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0=
, 0);">
I have been working on pldm firmware update and the pldm monitoring and cont=
rol.&nbsp;</div>
<div dir=3D"ltr" style=3D"font-family: Aptos, Aptos_MSFontService, -apple-sy=
stem, Roboto, Arial, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0=
, 0);">
<br>
</div>
<div dir=3D"ltr" style=3D"font-family: Aptos, Aptos_MSFontService, -apple-sy=
stem, Roboto, Arial, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0=
, 0);">
Problem:</div>
<div dir=3D"ltr" style=3D"font-family: Aptos, Aptos_MSFontService, -apple-sy=
stem, Roboto, Arial, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0=
, 0);">
<br>
</div>
<div dir=3D"ltr" style=3D"font-family: Aptos, Aptos_MSFontService, -apple-sy=
stem, Roboto, Arial, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0=
, 0);">
I am performing AMC &nbsp;firmware update &nbsp;from bmc and then simultaneo=
usly requesting sensor data from AMC using GetSensorReading command. Both th=
e commands get stuck at BMC's end and neither command is sent to AMC after t=
hat.&nbsp;</div>
<div dir=3D"ltr" style=3D"font-family: Aptos, Aptos_MSFontService, -apple-sy=
stem, Roboto, Arial, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0=
, 0);">
<br>
</div>
<ol start=3D"1" data-editing-info=3D"{&quot;applyListStyleFromLevel&quot;:fa=
lse,&quot;orderedStyleType&quot;:3}">
<li style=3D"font-family: Aptos, Aptos_MSFontService, -apple-system, Roboto,=
 Arial, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0); list-st=
yle-type: &quot;1) &quot;;">
<div dir=3D"ltr" role=3D"presentation">May I know whether we can pause get s=
ensor reading?</div>
</li><li style=3D"font-family: Aptos, Aptos_MSFontService, -apple-system, Ro=
boto, Arial, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0); li=
st-style-type: &quot;2) &quot;;">
<div dir=3D"ltr" role=3D"presentation">What's the ideal time interval betwee=
n two getsensorreading command?&nbsp;</div>
<div dir=3D"ltr" role=3D"presentation"><br>
</div>
<div dir=3D"ltr" role=3D"presentation">And let me know if u any other sugges=
tion to get rid of this issue. &nbsp;It would be great to hear from the Open=
BMC.</div>
</li></ol>
<div dir=3D"ltr" style=3D"font-family: Aptos, Aptos_MSFontService, -apple-sy=
stem, Roboto, Arial, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0=
, 0);">
Regards,</div>
<div dir=3D"ltr" style=3D"font-family: Aptos, Aptos_MSFontService, -apple-sy=
stem, Roboto, Arial, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0=
, 0);">
Shiva Shankar K.</div>
<div id=3D"ms-outlook-mobile-body-separator-line" data-applydefaultfontstyle=
s=3D"true" style=3D"font-family: Aptos, Aptos_MSFontService, -apple-system, R=
oboto, Arial, Helvetica, sans-serif; font-size: 12pt;" dir=3D"ltr">
<div dir=3D"ltr" style=3D"font-family: Aptos, Aptos_MSFontService, -apple-sy=
stem, Roboto, Arial, Helvetica, sans-serif; font-size: 12pt;">
<br>
</div>
</div>
<div style=3D"font-family: Aptos, Aptos_MSFontService, -apple-system, Roboto=
, Arial, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" id=3D=
"ms-outlook-mobile-signature" dir=3D"ltr">
</div>


</div></blockquote></div></body></html>=

--Apple-Mail-603FDCDA-90F3-49E5-A085-68B627C4866E--

