Return-Path: <chou.brad@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400e:c05::22d; helo=mail-pg0-x22d.google.com;
 envelope-from=chou.brad@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="kSD0etba"; 
 dkim-atps=neutral
Received: from mail-pg0-x22d.google.com (mail-pg0-x22d.google.com
 [IPv6:2607:f8b0:400e:c05::22d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40zkHy6s0mzF0dl
 for <openbmc@lists.ozlabs.org>; Mon,  4 Jun 2018 15:38:38 +1000 (AEST)
Received: by mail-pg0-x22d.google.com with SMTP id l2-v6so13938415pgc.7
 for <openbmc@lists.ozlabs.org>; Sun, 03 Jun 2018 22:38:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:mime-version:subject:date:references:to:in-reply-to:message-id;
 bh=LTRFI6UZNdm4kEysukOs89vvbtZJqMI2bddDFJs+guQ=;
 b=kSD0etbabvRnqsyjEldkpSZrjMlxGb8mcrHRmH0yVZ1kUhkDhRbJ5oLlgv4C7SOFIV
 HMpa41MkTl64zxdtR4VhY2QevMt4ISu4jtVyBsdrAoXu4X6VDsFkoPmJvgd9toVxyCer
 mfnwbayCy1HiYkK+kz6DLe6dNeteUqKtvqvD6mwbYgGhCwfO0YRCeaT39g81JHLYewJF
 6dXIBqzK3R85DL+E1+I0rbX77a6GQhlwyw+Rg1UFc1gO/GhjBz60m1LutMPzrWbyw8Ry
 BbRMFusOVBi5f/S3aRrB/MmkVUDczZKzPMf5yizOmxTRxCVggdtOdnNTMN3kjfdhIlYs
 pLpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:mime-version:subject:date:references:to
 :in-reply-to:message-id;
 bh=LTRFI6UZNdm4kEysukOs89vvbtZJqMI2bddDFJs+guQ=;
 b=SrVAs4GDfNO7AaOb9xRYbtbhOgVyIvkRDadPqp80gXmSf3Wm5w4h+6Ecaw1cwEfLn1
 GZF2m58wqIQx2Utd8Ir4OActTtTEBqAooOuiGbMmcooPPM9dVQOmSMvExyCCak4rwbRa
 a8AVAmXEKXoEkT6OF33iuR+vBM1AovbGhMB+rs8wHjdb4xoyOak352It6W+5RZ+QKrGD
 XnYrgmKfkywcju5CWRMYsGq8vZ+MQ4ZBG8L2aCdfJw/ppNexajPILMg2eBgzbDTGRVRW
 ZwQt1iYRoPLiHyUccQhBNoN2Rz6eZtDbjbuHX+oLPa3TD2qJcMPK+a9jDHcYqBe6t+0m
 zwcQ==
X-Gm-Message-State: ALKqPwfi+D1d4qdVVur9Oo/b3QvrZ+d95QvuzlzHtem2CselCQq7/D+d
 x58U4nvJ+dDph49ZHB3OtyfIVn4g
X-Google-Smtp-Source: ADUXVKLUY+D9+fTQ5pBYgZc5KtlDNDLIoQm8PSvCU+x1XThl9lA0zgHNUkxyXk1mU31k3vHUGw8oEw==
X-Received: by 2002:a63:7741:: with SMTP id
 s62-v6mr16415348pgc.103.1528090715210; 
 Sun, 03 Jun 2018 22:38:35 -0700 (PDT)
Received: from [192.168.1.2] (118-163-39-90.HINET-IP.hinet.net.
 [118.163.39.90])
 by smtp.gmail.com with ESMTPSA id s9-v6sm92188306pfa.141.2018.06.03.22.38.33
 for <openbmc@lists.ozlabs.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 03 Jun 2018 22:38:34 -0700 (PDT)
From: Brad Chou <chou.brad@gmail.com>
Content-Type: multipart/alternative;
 boundary="Apple-Mail=_6AD966F9-3382-4D51-B647-32564AE54384"
Mime-Version: 1.0 (Mac OS X Mail 11.3 \(3445.6.18\))
Subject: RE: IPMI and Redfish support in openbmc Linux
Date: Mon, 4 Jun 2018 13:38:31 +0800
References: <mailman.479.1527871603.18429.openbmc@lists.ozlabs.org>
To: openbmc@lists.ozlabs.org
In-Reply-To: <mailman.479.1527871603.18429.openbmc@lists.ozlabs.org>
Message-Id: <C98DD0A2-E79C-47D9-843D-D6012DA22A6C@gmail.com>
X-Mailer: Apple Mail (2.3445.6.18)
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
X-List-Received-Date: Mon, 04 Jun 2018 05:38:39 -0000


--Apple-Mail=_6AD966F9-3382-4D51-B647-32564AE54384
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

Hi Ed,
May I know how to use kcs with host ipmi ?
Any recipe need to be changed ?

Thanks.

> On Jun 2, 2018, at 00:46, openbmc-request@lists.ozlabs.org wrote:
>=20
> A subset of Ipmi 2.0 is provided by the Ipmi daemons here:
> https://github.com/openbmc/phosphor-host-ipmid =
<https://github.com/openbmc/phosphor-host-ipmid>
> https://github.com/openbmc/phosphor-net-ipmid =
<https://github.com/openbmc/phosphor-net-ipmid>
>=20
> Net IPMI supports the out of band ipmi over network.  Host ipmi =
supports in band ipmi over kcs or block transfer.
>=20
> There are several servers that support Redfish, and we have a working =
group that meets weekly to talk through technical issues each week, =
which you're welcome to attend.  The only one checked into the upstream =
project is bmcweb.  If you need help getting it started, I'm happy to =
help.
> https://github.com/openbmc/bmcweb <https://github.com/openbmc/bmcweb>
>=20
> Yes, ipmitool works compiles for the target, and includes an extra =
transport to be able to connect directly to dbus and do ipmi =
transactions from there.
>=20
> -Ed
>=20
> From: openbmc =
[mailto:openbmc-bounces+ed.tanous=3Dintel.com@lists.ozlabs.org =
<mailto:openbmc-bounces+ed.tanous=3Dintel.com@lists.ozlabs.org>] On =
Behalf Of AKASH G J
> Sent: Friday, June 1, 2018 2:23 AM
> To: openbmc@lists.ozlabs.org <mailto:openbmc@lists.ozlabs.org>
> Subject: IPMI and Redfish support in openbmc Linux
>=20
> Hi Team,
>=20
> I build the Linux image using the steps given in =
https://github.com/openbmc/openbmc <https://github.com/openbmc/openbmc>, =
target machine as Zaius. Whether support is available for IPMI 2.0 and =
Redfish interface? Is it possible to use ipmitool in the cross compiled =
Linux?


--Apple-Mail=_6AD966F9-3382-4D51-B647-32564AE54384
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=us-ascii

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3Dus-ascii"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" class=3D"">Hi =
Ed,<div class=3D"">May I know how to use kcs with host ipmi ?</div><div =
class=3D"">Any recipe need to be changed ?</div><div class=3D""><br =
class=3D""></div><div class=3D"">Thanks.</div><div class=3D""><div><br =
class=3D""><blockquote type=3D"cite" class=3D""><div class=3D"">On Jun =
2, 2018, at 00:46, <a href=3D"mailto:openbmc-request@lists.ozlabs.org" =
class=3D"">openbmc-request@lists.ozlabs.org</a> wrote:</div><br =
class=3D"Apple-interchange-newline"><div class=3D""><span =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none; float: none; =
display: inline !important;" class=3D"">A subset of Ipmi 2.0 is provided =
by the Ipmi daemons here:</span><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><a =
href=3D"https://github.com/openbmc/phosphor-host-ipmid" =
style=3D"font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
orphans: auto; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; widows: auto; word-spacing: 0px; =
-webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px;" =
class=3D"">https://github.com/openbmc/phosphor-host-ipmid</a><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D""><a =
href=3D"https://github.com/openbmc/phosphor-net-ipmid" =
style=3D"font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
orphans: auto; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; widows: auto; word-spacing: 0px; =
-webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px;" =
class=3D"">https://github.com/openbmc/phosphor-net-ipmid</a><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D""><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D""><span =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none; float: none; =
display: inline !important;" class=3D"">Net IPMI supports the out of =
band ipmi over network. &nbsp;Host ipmi supports in band ipmi over kcs =
or block transfer.</span><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><br style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">There are several servers that support Redfish, and we have a =
working group that meets weekly to talk through technical issues each =
week, which you're welcome to attend. &nbsp;The only one checked into =
the upstream project is bmcweb. &nbsp;If you need help getting it =
started, I'm happy to help.</span><br style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><a =
href=3D"https://github.com/openbmc/bmcweb" style=3D"font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; orphans: auto; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; =
-webkit-text-stroke-width: 0px;" =
class=3D"">https://github.com/openbmc/bmcweb</a><br style=3D"caret-color: =
rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; font-style: =
normal; font-variant-caps: normal; font-weight: normal; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><br style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">Yes, ipmitool works compiles for the target, and includes an =
extra transport to be able to connect directly to dbus and do ipmi =
transactions from there.</span><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><br style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">-Ed</span><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><br style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">From: openbmc [</span><a =
href=3D"mailto:openbmc-bounces+ed.tanous=3Dintel.com@lists.ozlabs.org" =
style=3D"font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
orphans: auto; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; widows: auto; word-spacing: 0px; =
-webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px;" =
class=3D"">mailto:openbmc-bounces+ed.tanous=3Dintel.com@lists.ozlabs.org</=
a><span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; =
font-size: 12px; font-style: normal; font-variant-caps: normal; =
font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none; float: none; display: inline !important;" class=3D"">] On Behalf =
Of AKASH G J</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none; float: none; display: inline !important;" class=3D"">Sent: Friday, =
June 1, 2018 2:23 AM</span><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">To:<span class=3D"Apple-converted-space">&nbsp;</span></span><a=
 href=3D"mailto:openbmc@lists.ozlabs.org" style=3D"font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; orphans: auto; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; =
-webkit-text-stroke-width: 0px;" =
class=3D"">openbmc@lists.ozlabs.org</a><br style=3D"caret-color: rgb(0, =
0, 0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">Subject: IPMI and Redfish support in openbmc Linux</span><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D""><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D""><span =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none; float: none; =
display: inline !important;" class=3D"">Hi Team,</span><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D""><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D""><span =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none; float: none; =
display: inline !important;" class=3D"">I build the Linux image using =
the steps given in<span =
class=3D"Apple-converted-space">&nbsp;</span></span><a =
href=3D"https://github.com/openbmc/openbmc" style=3D"font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; orphans: auto; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; =
-webkit-text-stroke-width: 0px;" =
class=3D"">https://github.com/openbmc/openbmc</a><span =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none; float: none; =
display: inline !important;" class=3D"">, target machine as Zaius. =
Whether support is available for IPMI 2.0 and Redfish interface? Is it =
possible to use ipmitool in the cross compiled =
Linux?</span></div></blockquote></div><br class=3D""></div></body></html>=

--Apple-Mail=_6AD966F9-3382-4D51-B647-32564AE54384--
