Return-Path: <openbmc+bounces-1734-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C07710AB828
	for <openbmc@archiver.kernel.org>; Thu, 26 Mar 2026 20:52:17 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fhbYk1R4pz2ydn;
	Fri, 27 Mar 2026 07:52:10 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2607:f8b0:4864:20::e35" arc.chain=google.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1774558329;
	cv=pass; b=IMMB2ZuZY1smJCp2L8H3knRIubhoqr1Syqmy3PsuvAhEK6v96Klfb9euMtJGTwyDnvvX5/T9fxvJBuZV2po4b9kZuEHJ5vTjOlcXvz/tWMlh2Gdgc4q9gS+UAPd9dCilVjFlAvKSepXim98ZWXDXjp9An7lRKP6Hz45UbmMOEBbKl3jiXgaWmA7VthbiflSNL5I6aMIwnx4EBfYoJ7JpGa55BUG2LFlg5Lz/7gDbwsgfBtALpfQer9jSX4XsLjLjsR+lMfd5dmE+4Q2L/QdkbrKJrzps5Fq/4AEUjB3TBQI3aqjam8V58ho6ZVvJluRZS+T19YUHW8mkIwZyy0Mw8Q==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1774558329; c=relaxed/relaxed;
	bh=HKfazeq1CowbeCFk+bxC8VzzntCvInVsgLI875V5Sz0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ddvz3FDodTaCGSxaIe/+VRm3gc0iKuC0dso5pCt5SPe/FfJOf/OuBX7tpsstAE9mqUZ021W9rY25TEejKjHB4sFwpD+4ogFcBt4SaAHd09yplDKyX33493brC9xkPp1FQDejBFOxGW4gJ+1v9W6xYjb8qSuaGaLs02XMnZG/kY+DR22QhIlaXkEUJPymOUJEkDwNcpTFCE/8O4eoQH8xJtz0HFB6fClg7heM+2tymMqWpd6Q7hfe60+o0saMH7h5+z7OFl1MOeyEjv2w4mlsH3MCpey22IeYRQXUfYH+G77U7alJbV2z3Gk6l/yrlxWFx44HuxB1X7aJ2NghjqYC1w==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=r7nU7Q9S; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::e35; helo=mail-vs1-xe35.google.com; envelope-from=geissonator@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=r7nU7Q9S;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::e35; helo=mail-vs1-xe35.google.com; envelope-from=geissonator@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-vs1-xe35.google.com (mail-vs1-xe35.google.com [IPv6:2607:f8b0:4864:20::e35])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fhbYh5fY7z2yZ6
	for <openbmc@lists.ozlabs.org>; Fri, 27 Mar 2026 07:52:07 +1100 (AEDT)
Received: by mail-vs1-xe35.google.com with SMTP id ada2fe7eead31-5ffe9a5b128so496462137.2
        for <openbmc@lists.ozlabs.org>; Thu, 26 Mar 2026 13:52:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774558324; cv=none;
        d=google.com; s=arc-20240605;
        b=c1ubZ8gf8C5V/3aPph65E6M37fpmsGdoTTSKFjp92UxTvMzMIlZepXaK+8+b3rtnsA
         VO/DPbIpaI2NNR99jQtv8pKv4Xpdxb/dOYQose+DoVg1g+4eIRcVLry1JHfgbjHvO5pc
         R0xEDtAlHiXYcWAUf12JJwFc3eRQ7inct5LAxflL13KiTyKoeqhvarKNV27Yvj8FjZ5V
         cW5hixqRMdptjaCLYyGFrlRkLkkTh1PX+YuhO/h+zlQwGsjQeoPOiTTLApuM71+haD3x
         S6v7HZeJJb5Bz7TVJgTTZearfIEFJazi35RPuUsgDvA9EpyN29mB9h6M7BATRBl0CnQm
         s8Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=HKfazeq1CowbeCFk+bxC8VzzntCvInVsgLI875V5Sz0=;
        fh=OitTwO/qGE6hbinVOpzQ0GTz4AQB9RuDlpTRO439NYc=;
        b=Tl5kgxvo2lIYCI4VgD/u9c6k0wMFf1SIqj7eFKVM3gseegWJID76YOzZXlp/6JxT74
         YOETnSK9NLwtdklhudxNaX23h9Prpagi25c6veSOZaMzUKzFX0yj9m6K68uzkUMYDK7I
         1oUFQGHE9eHu4mGKQD7zkQIEcpOIlvzMvyP9/blOcsGd+8nzIOEjYDRS0r/ea5CKa/Bg
         Y9i6kF7kfn8IcFDcfJnCkdi7ZSYoeQGWBJ1LFs2AHcyJzz7hOPnoSQbvz8y1FM0epZQc
         mgokGqrRwYMW/vzdPtdvVkTF+RU0DGbZnP3gLFDBDEEuUeCePS72dOgUfdVY8GICQF5P
         OMyw==;
        darn=lists.ozlabs.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774558324; x=1775163124; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HKfazeq1CowbeCFk+bxC8VzzntCvInVsgLI875V5Sz0=;
        b=r7nU7Q9SkaeQPiicegZ/xRVFmeO0L3B3KL1G5qrh4N207t59R+iMNvfVeBfjnE+OIm
         mBq1zekV9f9roLg5FJUAJKudDjkp7LESjY1kZ+C56wQ32YCQnjxBum5CSN+39Z8OG7AV
         bEDocqBwltlb4DovJUplPqKlT1fEVAIW9j46czVykTJG7It5oWB3zvUXNpDTvBg3N7iz
         SHR5DzXUEy18Xy4gKc9mdEsTEyR/Zhkf8J2w8O2+QjJInLOszdaIJU7AlXnhicj+iojS
         036W6OOwzvWJrdp91cERJgRzziL3xrPexKVYYpNtqvP25ewW0xdtYdva/4Bcaz3ZP0Z0
         2QnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774558324; x=1775163124;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HKfazeq1CowbeCFk+bxC8VzzntCvInVsgLI875V5Sz0=;
        b=U6IIw7ZtKr9QPvIw0gmNIceswEoKTenBKLlbFuIbXg1JrvTq554chC+sg3aHByM3N5
         pwYQloB0nQzrL5GFkBj3kKuPWFBl4UiQOCJfL1PULkp3Rc9uX+VneQjdtGeKxYriIK6t
         n39PU3dPcKy4gfYCPR7psW+gIL4DijJl1DR7j+voeITThgsccvTASwvQNciQeEBHsno6
         lhrR34egulELJNMQHPplJ9s7UyMGCZUEIdiNibGVq3NoF1iFy3EDqtLZIrElmq+/gx33
         XVLJ5kLUKHtDynvRpqaBD2wjWH6miwXMFeiJ1wQvugWjUxZfXpkRmpQ+hmjtu0FEAysi
         EOWQ==
X-Gm-Message-State: AOJu0YxV9LsLhfX4ZpVXYZ+XZIDxt1CRyzvoUAUdhAWemtbSl/cOZVnj
	xa1Y0M09JTBNxFo9ScBeUFwO4Gb1fXvJtd7WqodZfprTvKG7pwNHBfr9Vb+soGSIkBMitC04CtQ
	2krox3qoBIzh/zffaSgaP2eJslhcrnKA=
X-Gm-Gg: ATEYQzyBKx20ZVhX0AVIUwqGNPy047+axmJymfTUXKngC3dTt2TnH7Jp2FvRDhJe/V0
	qaPNMwm98McaUUgWRiP9gArIne0fe1y54AV/DeHOke/74CkxWL5idTJMXW52yLDGp2GFnk8yp1/
	l4yRPrO11HuaVGaRV1NDkc8RQqnoLo1oFOZPHhHbZ8jAPIwNAc0hIXRsQq6MFrL5+MdmUYbLUOT
	6qLsdg6BPUrFeX4z61ADUDy9q9SNCWLlBjyXydFjBRWZMLV98ALsBI67/TgHzAM0FeeOOxLZCTB
	JT9PKci4JSrwFnX5EBgcJyylK/3izO014pqmROCk7kGOLZ9QR8p73edFlkOWl6AMqBvO/f/nOYN
	Tmj9a1pGwivi5H2NYMotUrw+OEfUGIbMyvljX
X-Received: by 2002:a05:6102:ccd:b0:602:8b67:37de with SMTP id
 ada2fe7eead31-604f92f99edmr41572137.29.1774558324157; Thu, 26 Mar 2026
 13:52:04 -0700 (PDT)
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
MIME-Version: 1.0
References: <CYXPR12MB93185FD460BF55DC0279B0B796EEA@CYXPR12MB9318.namprd12.prod.outlook.com>
 <CYXPR12MB931837C7EBDACBD6666142C496D4A@CYXPR12MB9318.namprd12.prod.outlook.com>
 <CYXPR12MB93181BCE398A25D35049D2BC969BA@CYXPR12MB9318.namprd12.prod.outlook.com>
 <CYXPR12MB93181140295A2FD0AD6A2FF49656A@CYXPR12MB9318.namprd12.prod.outlook.com>
In-Reply-To: <CYXPR12MB93181140295A2FD0AD6A2FF49656A@CYXPR12MB9318.namprd12.prod.outlook.com>
From: Andrew Geissler <geissonator@gmail.com>
Date: Thu, 26 Mar 2026 15:51:48 -0500
X-Gm-Features: AQROBzC4u9uSixZp-AZ29z9lUtNXbNuZo3VgRUz3it4WsG5sNE8ijk3gCMlVYTw
Message-ID: <CALLMt=q=aYHsTOv9V3uMiStDHsXG6WJfFKjZXYG=8Okxk5WhXA@mail.gmail.com>
Subject: Re: updated Schedule A of CCLA from AMD
To: "Venkatesh, Supreeth" <Supreeth.Venkatesh@amd.com>
Cc: openbmc <openbmc@lists.ozlabs.org>, "Fisk, Chris" <Chris.Fisk@amd.com>, 
	"Chatradhi, Naveen Krishna" <NaveenKrishna.Chatradhi@amd.com>, "Lin, Terry" <Terry.Lin@amd.com>, 
	"Cheng, Albin" <Albin.Cheng@amd.com>, "Othayoth, Jayanth" <Jayanth.Othayoth@amd.com>
Content-Type: multipart/alternative; boundary="0000000000008b7084064df38e5f"

--0000000000008b7084064df38e5f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 26, 2026 at 11:57=E2=80=AFAM Venkatesh, Supreeth <
Supreeth.Venkatesh@amd.com> wrote:

> [AMD Official Use Only - AMD Internal Distribution Only]
>
> Please find updated Schedule A of CCLA from AMD attached.
>
> Updated CCLA necessitated because of Schedule A change to add new members=
.
> [CCed]
>

Thanks for keeping your CCLA updated. I've uploaded it to the projects
google drive.

Andrew


> *Sent:* Thursday, November 20, 2025 10:36 AM
> *To:* openbmc <openbmc@lists.ozlabs.org>; Andrew Geissler <
> geissonator@gmail.com>
> *Cc:* Ye, Iris <Iris.Ye@amd.com>; Chiang, Bevis <Bevis.Chiang@amd.com>;
> Wang, Ryan <Ryan.Wang3@amd.com>; Lu, Brian <Brian.Lu@amd.com>; Albert,
> Jason <Jason.Albert@amd.com>; Lee, Ben (Engineering) <KaiWei.Lee@amd.com>=
;
> Ng, Ping Jie <PingJie.Ng@amd.com>; Cheng, Albin <Albin.Cheng@amd.com>;
> Kumar, Ashok2 <Ashok2.Kumar@amd.com>
> *Subject:* RE: updated Schedule A of CCLA from AMD
>
>
>
> *Caution:* This message originated from an External Source. Use proper
> caution when opening attachments, clicking links, or responding.
>
>
>
> [AMD Official Use Only - AMD Internal Distribution Only]
>
>
>
> Please find updated Schedule A of CCLA from AMD attached.
>
> Updated CCLA necessitated because of Schedule A change to add new members=
.
>
>
>
> Thanks,
>
> *Supreeth Venkatesh*
>
> System Manageability Architect  |*  AMD*
> Server Software
>
>
>

--0000000000008b7084064df38e5f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Mar 26,=
 2026 at 11:57=E2=80=AFAM Venkatesh, Supreeth &lt;<a href=3D"mailto:Supreet=
h.Venkatesh@amd.com">Supreeth.Venkatesh@amd.com</a>&gt; wrote:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex"><div class=3D"msg31846967920=
40048166">





<div lang=3D"EN-US" style=3D"overflow-wrap: break-word;">
<p style=3D"font-family:Calibri;font-size:10pt;color:rgb(0,0,255);margin:5p=
t;font-style:normal;font-weight:normal;text-decoration:none" align=3D"Left"=
>
[AMD Official Use Only - AMD Internal Distribution Only]<br>
</p>
<br>
<div>
<div class=3D"m_3184696792040048166WordSection1">
<p class=3D"MsoNormal">Please find updated Schedule A of CCLA from AMD atta=
ched.<u></u><u></u></p>
<p class=3D"MsoNormal">Updated CCLA necessitated because of Schedule A chan=
ge to add new members. [CCed]<span style=3D"font-size:11pt;font-family:&quo=
t;Calibri&quot;,sans-serif"><br></span></p></div></div></div></div></blockq=
uote><div><br></div><div>Thanks for keeping your CCLA updated. I&#39;ve upl=
oaded it to the projects google=C2=A0drive.</div><div><br></div><div>Andrew=
</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><d=
iv class=3D"msg3184696792040048166"><div lang=3D"EN-US" style=3D"overflow-w=
rap: break-word;"><div><div class=3D"m_3184696792040048166WordSection1"><p =
class=3D"MsoNormal"><span style=3D"font-size:11pt;font-family:&quot;Calibri=
&quot;,sans-serif">
<b>Sent:</b> Thursday, November 20, 2025 10:36 AM<br>
<b>To:</b> openbmc &lt;<a href=3D"mailto:openbmc@lists.ozlabs.org" target=
=3D"_blank">openbmc@lists.ozlabs.org</a>&gt;; Andrew Geissler &lt;<a href=
=3D"mailto:geissonator@gmail.com" target=3D"_blank">geissonator@gmail.com</=
a>&gt;<br>
<b>Cc:</b> Ye, Iris &lt;<a href=3D"mailto:Iris.Ye@amd.com" target=3D"_blank=
">Iris.Ye@amd.com</a>&gt;; Chiang, Bevis &lt;<a href=3D"mailto:Bevis.Chiang=
@amd.com" target=3D"_blank">Bevis.Chiang@amd.com</a>&gt;; Wang, Ryan &lt;<a=
 href=3D"mailto:Ryan.Wang3@amd.com" target=3D"_blank">Ryan.Wang3@amd.com</a=
>&gt;; Lu, Brian &lt;<a href=3D"mailto:Brian.Lu@amd.com" target=3D"_blank">=
Brian.Lu@amd.com</a>&gt;;
 Albert, Jason &lt;<a href=3D"mailto:Jason.Albert@amd.com" target=3D"_blank=
">Jason.Albert@amd.com</a>&gt;; Lee, Ben (Engineering) &lt;<a href=3D"mailt=
o:KaiWei.Lee@amd.com" target=3D"_blank">KaiWei.Lee@amd.com</a>&gt;; Ng, Pin=
g Jie &lt;<a href=3D"mailto:PingJie.Ng@amd.com" target=3D"_blank">PingJie.N=
g@amd.com</a>&gt;; Cheng, Albin &lt;<a href=3D"mailto:Albin.Cheng@amd.com" =
target=3D"_blank">Albin.Cheng@amd.com</a>&gt;;
 Kumar, Ashok2 &lt;<a href=3D"mailto:Ashok2.Kumar@amd.com" target=3D"_blank=
">Ashok2.Kumar@amd.com</a>&gt;<br>
<b>Subject:</b> RE: updated Schedule A of CCLA from AMD</span></p><div><div=
><div style=3D"border-width:1pt medium medium;border-style:solid none none;=
border-color:rgb(225,225,225) currentcolor currentcolor;padding:3pt 0in 0in=
">
</div>
</div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<table border=3D"0" cellspacing=3D"0" cellpadding=3D"0" align=3D"left" widt=
h=3D"100%" style=3D"width:100%">
<tbody>
<tr>
<td style=3D"background:rgb(255,185,0);padding:5pt 2pt"></td>
<td width=3D"100%" style=3D"width:100%;background:rgb(255,248,229);padding:=
5pt 4pt 5pt 12pt">
<div>
<p class=3D"MsoNormal">
<b><span style=3D"color:rgb(34,34,34)">Caution:</span></b><span style=3D"co=
lor:rgb(34,34,34)"> This message originated from an External Source. Use pr=
oper caution when opening attachments, clicking links, or responding.
<u></u><u></u></span></p>
</div>
</td>
</tr>
</tbody>
</table>
<p class=3D"MsoNormal"><span><u></u>=C2=A0<u></u></span></p>
<div>
<p style=3D"margin:5pt"><span style=3D"font-size:10pt;font-family:&quot;Cal=
ibri&quot;,sans-serif;color:blue">[AMD Official Use Only - AMD Internal Dis=
tribution Only]<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span><u></u>=C2=A0<u></u></span></p>
<div>
<p class=3D"MsoNormal">Please find updated Schedule A of CCLA from AMD atta=
ched.<u></u><u></u></p>
<p class=3D"MsoNormal">Updated CCLA necessitated because of Schedule A chan=
ge to add new members.<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:10pt;font-family:&quot;Aria=
l&quot;,sans-serif;color:black">Thanks,</span><span><u></u><u></u></span></=
p>
<p class=3D"MsoNormal"><b><span style=3D"font-size:10pt;font-family:&quot;A=
rial&quot;,sans-serif;color:black">Supreeth Venkatesh</span></b><span><u></=
u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:9pt;font-family:&quot;Arial=
&quot;,sans-serif;color:black">System Manageability Architect=C2=A0=C2=A0|<=
b>=C2=A0=C2=A0AMD</b><br>
Server Software</span><span><u></u><u></u></span></p>
</div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
</div>
</div>
</div>
</div>
</div>

</div></blockquote></div></div>

--0000000000008b7084064df38e5f--

