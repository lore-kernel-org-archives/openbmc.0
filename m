Return-Path: <emilyshaffer@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::82b; helo=mail-qt1-x82b.google.com;
 envelope-from=emilyshaffer@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="v8a9D9eZ"; 
 dkim-atps=neutral
Received: from mail-qt1-x82b.google.com (mail-qt1-x82b.google.com
 [IPv6:2607:f8b0:4864:20::82b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42bgp94z2kzF3Hy
 for <openbmc@lists.ozlabs.org>; Fri, 19 Oct 2018 07:37:21 +1100 (AEDT)
Received: by mail-qt1-x82b.google.com with SMTP id l41-v6so35877667qtl.8
 for <openbmc@lists.ozlabs.org>; Thu, 18 Oct 2018 13:37:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2KdKxcQcYxGKLru94k1YYB+V0Z6Sbt3ifD/yi8IxL68=;
 b=v8a9D9eZ7tiEXLoLuxIIc9hC8z7FFkM9IYPExTovVNLMMvvueMhlz495d16vAfbYjo
 rHDnj9MafKlwA8GxGtlF6eixzc1b8/lYNPio4ayzyimwGksdXN/sIN6mvXA22gZPqHl2
 /s6SZxsTzyKJirzfPoF6snKypS3ThG4wE5gq72YGXKdKtfs3keGzHwf72Jp+AfS+UtF2
 PYhxLvM0iTAD/3GxdJCptHw4LxCpgERF+vRiT8mUNN2gvFTQzcHu4iEIDoOJDNhbHcAZ
 XOu3M3gLXFPu0BGRRJk0T7TlwPDUqPXpcCjpeSTuVqoHK1Oujt+08gLdlwVy4GuRJ4qK
 JDYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2KdKxcQcYxGKLru94k1YYB+V0Z6Sbt3ifD/yi8IxL68=;
 b=WOrv4R7uT6+RLubv1NBC+sb6SHRbT/HxjUPKtna7RZFNDpbMYESIOGo1RsXGvRHBXJ
 5yfqZhjN9fYtWc1Db7VZnovi50du5HR8xcZGdjcENcHtnjivGVzRw46QxQRUwK0ab4CE
 vXBusxVCRU5KAVF7hIn5mwc+u1kCXL7lfLexBQSh8G9tOcaA0CQHCQP9CsFwSZHqV3e2
 OKGiC1GKMXhehD9aN/RW4k6BV36CyPTb1t/z+R4OLSsLR5MFu+Uuu+ji9pJkci7wCxoa
 22Go1+v9RIqXwYYjedWAJJZwNqseZ8XFLlmSL/CF3rZ4RqdwbPd68YFHvEblD1v4yvCM
 TFzg==
X-Gm-Message-State: AGRZ1gJUZG19s4eH+1Pr+q/r6jLfOzYSI8XstyRshzmz/hCr3maXIBHg
 e5TVXKhwXZ9m6eXem/x3LJx/vSpn56C2t7IEuaYMpw==
X-Google-Smtp-Source: AJdET5c9LVSLvmwEyurZVJhbAdIFAQ+3bLLP6UR2E08YPOwz7rMjr12xvTV49cLOcgZzIXCkOnsWFCMFjLAtg7DeU+o=
X-Received: by 2002:ac8:3155:: with SMTP id
 h21-v6mr2811162qtb.125.1539895039173; 
 Thu, 18 Oct 2018 13:37:19 -0700 (PDT)
MIME-Version: 1.0
References: <3B781DAB-16CE-421D-BDCC-DDA2B74EF680@fb.com>
In-Reply-To: <3B781DAB-16CE-421D-BDCC-DDA2B74EF680@fb.com>
From: Emily Shaffer <emilyshaffer@google.com>
Date: Thu, 18 Oct 2018 13:37:08 -0700
Message-ID: <CAJoAoZmcMvu-JAW6WuTLm_cxth+p4DuSXGwMGPBik2VzMggGWw@mail.gmail.com>
Subject: Re: ipmi inventory
To: Vijay Khemka <vijaykhemka@fb.com>
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>
Content-Type: multipart/alternative; boundary="000000000000cd7c4d057886c017"
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
X-List-Received-Date: Thu, 18 Oct 2018 20:37:22 -0000

--000000000000cd7c4d057886c017
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

From the spec:

"Indicates the physical entity that the sensor is monitoring or is otherwis=
e
associated with the sensor. See Table 43-, Entity ID Codes."

Header for that table:

"The Entity ID field is used for identifying the physical entity that a
sensor or device is associated with. If multiple
sensors refer to the same entity, they will have the same Entity ID field
value. For example, if a voltage sensor
and a temperature sensor are both for a =E2=80=98Power Supply 1=E2=80=99 en=
tity the Entity
ID in their sensor data records would
both be 10 (0Ah), per the Entity ID table."

Check out the spec on your own for the table. It starts on page 550 as
written in the pdf (although the file itself puts that on page 576)

On Thu, Oct 18, 2018 at 1:33 PM Vijay Khemka <vijaykhemka@fb.com> wrote:

> Hi,
>
> I am trying to find reference to entityID defined in config.yaml for ipmi
> unventory map. I see different value of entityID for different sections. =
Is
> there any documentation which defines what should be entityID and instanc=
e
> for each section.
>
>
>
> Regards
>
> -Vijay
>

--000000000000cd7c4d057886c017
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">From the spec:<br><br><div>&quot;Indicates the physical en=
tity that the sensor is monitoring or is otherwise</div><div>associated wit=
h the sensor. See Table 43-, Entity ID Codes.&quot;</div><div><br></div><di=
v>Header for that table:<br><br>&quot;The Entity ID field is used for ident=
ifying the physical entity that a sensor or device is associated with. If m=
ultiple</div><div>sensors refer to the same entity, they will have the same=
 Entity ID field value. For example, if a voltage sensor</div><div>and a te=
mperature sensor are both for a =E2=80=98Power Supply 1=E2=80=99 entity the=
 Entity ID in their sensor data records would</div><div>both be 10 (0Ah), p=
er the Entity ID table.&quot;</div><div><br></div><div>Check out the spec o=
n your own for the table. It starts on page 550 as written in the pdf (alth=
ough the file itself puts that on page 576)</div></div><br><div class=3D"gm=
ail_quote"><div dir=3D"ltr">On Thu, Oct 18, 2018 at 1:33 PM Vijay Khemka &l=
t;<a href=3D"mailto:vijaykhemka@fb.com">vijaykhemka@fb.com</a>&gt; wrote:<b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border=
-left:1px #ccc solid;padding-left:1ex">





<div lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72">
<div class=3D"m_4067429387427170131WordSection1">
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">Hi,<u></u><u></u></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">I am trying to find=
 reference to entityID defined in config.yaml for ipmi unventory map. I see=
 different value of entityID for different sections. Is there any documenta=
tion which defines what should be entityID
 and instance for each section.<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><u></u>=C2=A0<u></u=
></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">Regards<u></u><u></=
u></span></p></div></div><div lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954=
F72"><div class=3D"m_4067429387427170131WordSection1">
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">-Vijay<u></u><u></u=
></span></p>
</div></div></blockquote></div>

--000000000000cd7c4d057886c017--
