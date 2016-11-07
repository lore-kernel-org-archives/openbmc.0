Return-Path: <brendanhiggins@google.com>
Received: from mail-qk0-x235.google.com (mail-qk0-x235.google.com
 [IPv6:2607:f8b0:400d:c09::235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tCP820J17zDt4R
 for <openbmc@lists.ozlabs.org>; Tue,  8 Nov 2016 07:25:21 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="ePPkacM5"; 
 dkim-atps=neutral
Received: by mail-qk0-x235.google.com with SMTP id n21so80948919qka.3
 for <openbmc@lists.ozlabs.org>; Mon, 07 Nov 2016 12:25:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to;
 bh=u3sizzHYbYiHyxTpwyc/FJy1cDOgAicWwrSXWoS3gCY=;
 b=ePPkacM5+ft7wheo37Sb11MMUusX0tjyV+D4lox1pigLUxVMijJH5vvDzZ5dO+Qnsn
 9kz/S/UBmrQE3wNZvGMDv0O5HLFdrrE1AAQ6STW8Xw7WjlzPh7S5VRXlTaaKmjcBmzWr
 xPZRLw9tp+v7mnclmCADsGzrwN2QS+GlWbLkw9MjpbkPwt3xo460AoqBXeiF0+y6H1EK
 XMcJYBE5oRbq/ZIhF4tE2mkxwhDH1bDJPf2UiWLNlCckxpW9e5sOH2rjqwVSI04p/jeR
 cTEkSIMunIQMlVMFJNrQ0yF1eO30hCsGbYl9aigqUpD0nxLISrYQkJl6o2ZT8TGGMI+2
 zcTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to;
 bh=u3sizzHYbYiHyxTpwyc/FJy1cDOgAicWwrSXWoS3gCY=;
 b=Ikf7k0IRfRaTbbL0bJvcYjbXtvKe85p9F4/bwuelZWwdT1335uDrR+Qjb26Lebu/Bk
 /FpymMEOc12nq1SZsgLksEJHXLtqTWcRnOnfUigtgappvYhXRx9iiDUu9Xsyfp7LcL4m
 2niWQAMlmwsrPx6RmVfOT9mDFQbE377KNn7Gs+VMDRJIYhCbLbWV9RbcCcfFfz5GV2O4
 21CNgbCp+KfM7NRcxoM82g3+R5dgqufeUylBloOSHhZiOIlGN2Vi5/0qxyyhDyMRplSJ
 suD05jUOi/rogGzmlq12LhzRGVW9A5YtWp5EWxnB1lwrGnR1Ku2cmZC7S1HbdV905wXj
 XddQ==
X-Gm-Message-State: ABUngveZ3XpFz46ey/2KZUb8myp5fB2t2GIIQTng00U5Ur2PVBX9ktmZm+YDVxRii5T2uaH4LbNLri/qpkclVkvP
X-Received: by 10.55.23.65 with SMTP id i62mr7916078qkh.238.1478550319096;
 Mon, 07 Nov 2016 12:25:19 -0800 (PST)
MIME-Version: 1.0
Received: by 10.12.137.220 with HTTP; Mon, 7 Nov 2016 12:25:18 -0800 (PST)
In-Reply-To: <58208518.50202@linux.vnet.ibm.com>
References: <58208518.50202@linux.vnet.ibm.com>
From: Brendan Higgins <brendanhiggins@google.com>
Date: Mon, 7 Nov 2016 12:25:18 -0800
Message-ID: <CAFd5g45JxpeYZiq3inm0JkKeyQjk7T_4uARLY=Anf9EHXymhBQ@mail.gmail.com>
Subject: Re: Discussion on IPMI provider libraries
To: tomjose <tomjose@linux.vnet.ibm.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary=001a1147a0528dd2820540bbd253
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
X-List-Received-Date: Mon, 07 Nov 2016 20:25:22 -0000

--001a1147a0528dd2820540bbd253
Content-Type: text/plain; charset=UTF-8

Sharing the provider libraries makes sense; my first area of concern is the
API; I am currently working on a change to the API (see
https://gerrit.openbmc-project.xyz/#/c/841/ for details); I would prefer
you do not make any changes to the current API, but understand if the need
arises before my change is ready.

Could you elaborate on how you plan on enforcing privilege? Having each
provider check privilege level seems like a leaky abstraction to me; I
think it would make more sense to have privilege managed by the host-ipmid
and the net-ipmid.

As far as the actual details concerning phosphor-net-ipmid: I do not have
strong opinions on the matter as Google has no intention of using IPMI over
LAN at this time, but would welcome discussion on the matter nonetheless.

Cheers

--001a1147a0528dd2820540bbd253
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Sharing the provider libraries makes sense; my first area =
of concern is the API; I am currently working on a change to the API (see=
=C2=A0<a href=3D"https://gerrit.openbmc-project.xyz/#/c/841/" target=3D"_bl=
ank">https://gerrit.openbmc-<wbr>project.xyz/#/c/841/</a>=C2=A0for details)=
; I would prefer you do not make any changes to the current API, but unders=
tand if the need arises before my change is ready.<div><br class=3D"gmail-A=
pple-interchange-newline"><span style=3D"color:rgb(0,0,0);font-family:sans-=
serif;font-size:13px">Could you elaborate on how you plan on enforcing priv=
ilege? Having each provider check privilege level seems like a leaky abstra=
ction to me; I think it would make more sense to have privilege managed by =
the host-ipmid and the net-ipmid.</span><br></div><div><br></div><div>As fa=
r as the actual details concerning <span style=3D"color:rgb(33,33,33);font-=
family:&quot;helvetica neue&quot;,helvetica,arial,sans-serif">phosphor-net-=
ipmid: I do not have strong opinions on the matter as Google has no intenti=
on of using IPMI over LAN at this time, but would welcome discussion on the=
 matter nonetheless.</span></div><div><span style=3D"color:rgb(33,33,33);fo=
nt-family:&quot;helvetica neue&quot;,helvetica,arial,sans-serif"><br></span=
></div><div><span style=3D"color:rgb(33,33,33);font-family:&quot;helvetica =
neue&quot;,helvetica,arial,sans-serif">Cheers</span></div></div>

--001a1147a0528dd2820540bbd253--
