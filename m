Return-Path: <brendanhiggins@google.com>
Received: from mail-qt0-x236.google.com (mail-qt0-x236.google.com
 [IPv6:2607:f8b0:400d:c0d::236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tHnYX3gB3zDvQx
 for <openbmc@lists.ozlabs.org>; Tue, 15 Nov 2016 10:59:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="VtRBMrBF"; 
 dkim-atps=neutral
Received: by mail-qt0-x236.google.com with SMTP id n6so58361574qtd.1
 for <openbmc@lists.ozlabs.org>; Mon, 14 Nov 2016 15:59:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=H2lQ4uz03UrfGkHuG3/G+LC3DbaJBK0fYbtjXpi/Fg4=;
 b=VtRBMrBFUPZyBvIxitvSob+znWA6Ww4ch6SCqitc/pcsozIfjL3gMfW6xrQ1WVQY0x
 LvMaiJw3CI/tIRoyvUIPiwdF1Hd5YWymg86tssm/OJZDfEjyCrNfwwYbPjEpBD1JIj8+
 WRkHW7xTwvuTMsn18IVduZR7vomc9b2y0fKFME7izi4YRVp2xV2p1sEiglaEzYQ8V0Tf
 F83Low9hda6oyo7IobjCoZeoDLBhCl+vkTmfm7Xv1nnOZFWFdpcXILIxKV60GFF02cLo
 niOWC4Teh4+XFr2fkq+6Ke7IONjjLlPL/rylobYC/76rKSw1IkEO0+2WVVEUnipOeB8U
 GAsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=H2lQ4uz03UrfGkHuG3/G+LC3DbaJBK0fYbtjXpi/Fg4=;
 b=QoR0Nm6To0meo6Oxfz8w6a+vhZW7GiE+XYGjvS73ED6ix+6FNL3J+GfiacfHXMNM2o
 XxuoGRNMghaf2T3j/BWo2EtC46bNQZ/8Ph4wmzBuUD801HUIqDin7/iFnjFVC1za+RvL
 6yr2IQ7sgKogFNahWHRRTX1vx8nWHw54ZCrLhfoE8/C9uCLmDciE6f3MaZF5taex1FR1
 HSEJVr1RvNSvsm1A5z+HYhbdnYINEyFNBBKdRshEmWk6ZtJ4utHgNFAnfkYMR0FRmlhD
 q8xLI7tpdgbenzFRZRmBxmgg6OemsnZeAr2rFfkMttRBQK10IWt+TC86X69J/eud26G0
 ZROA==
X-Gm-Message-State: ABUngvewP3P+sA6oWER4SzPUsJN8hwYuGBAxe5OlIvWGw5P7QUmObhXeY3JBm0Cpzm+xrtoAoG/ChmnZPMQDZEJv
X-Received: by 10.200.34.108 with SMTP id p41mr9475989qtp.269.1479167949274;
 Mon, 14 Nov 2016 15:59:09 -0800 (PST)
MIME-Version: 1.0
Received: by 10.12.137.220 with HTTP; Mon, 14 Nov 2016 15:59:08 -0800 (PST)
In-Reply-To: <5821A449.3020807@linux.vnet.ibm.com>
References: <58208518.50202@linux.vnet.ibm.com>
 <CAFd5g45JxpeYZiq3inm0JkKeyQjk7T_4uARLY=Anf9EHXymhBQ@mail.gmail.com>
 <5821A449.3020807@linux.vnet.ibm.com>
From: Brendan Higgins <brendanhiggins@google.com>
Date: Mon, 14 Nov 2016 15:59:08 -0800
Message-ID: <CAFd5g46QM8PyrGSFjL2Otq_dLOmCcdELL_-nQh1Th09kPMbYFQ@mail.gmail.com>
Subject: Re: Discussion on IPMI provider libraries
To: tomjose <tomjose@linux.vnet.ibm.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary=001a11422baa2e42f105414ba089
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 14 Nov 2016 23:59:13 -0000

--001a11422baa2e42f105414ba089
Content-Type: text/plain; charset=UTF-8

>
> From what i have noticed in the patch, there is support for
> ipmid_callback_t handlers  as it is now. So the change in API is to
> accommodate the OEM group ?
> So do you have plans to change the callback signatures for the standard
> commands already implemented in host-ipmid?


The support for ipmid_callback_t is only for backwards compatibility. Part
of the change in the API was to accommodate OEM/Group extensions, yes;
however, the intention is also to provide a cleaner API in general.

The privilege provided by each command is a registration parameter and it
> is consumed only by net-ipmid.


That's fine, but in that case it should not go in the callback; it should
be maintained and enforced by net-ipmid when it looks up a handler.

Cheers

--001a11422baa2e42f105414ba089
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><span st=
yle=3D"font-size:12.8px">From what i have noticed in the patch, there is su=
pport for ipmid_callback_t handlers=C2=A0 as it is now. So the change in AP=
I is to accommodate the OEM group ?</span><br style=3D"font-size:12.8px"><s=
pan style=3D"font-size:12.8px">So do you have plans to change the callback =
signatures for the standard commands already implemented in host-ipmid?</sp=
an></blockquote><div><br></div><div>The support for=C2=A0<span style=3D"fon=
t-size:12.8px">ipmid_callback_t is only for backwards compatibility. Part o=
f the change in the API was to accommodate OEM/Group extensions, yes; howev=
er, the intention=C2=A0is also to provide a cleaner API in general.</span><=
/div><div><span style=3D"font-size:12.8px"><br></span></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex"><span style=3D"font-size:12.8px">The pri=
vilege provided by each command is a registration parameter and it is consu=
med only by net-ipmid.</span></blockquote><div><br></div><div>That&#39;s fi=
ne, but in that case it should not go in the callback; it should be maintai=
ned and enforced by net-ipmid when it looks up a handler.</div><div><br></d=
iv><div>Cheers</div></div>

--001a11422baa2e42f105414ba089--
