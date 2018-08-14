Return-Path: <emilyshaffer@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:400d:c09::22f; helo=mail-qk0-x22f.google.com;
 envelope-from=emilyshaffer@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="S0LsTfU+"; 
 dkim-atps=neutral
Received: from mail-qk0-x22f.google.com (mail-qk0-x22f.google.com
 [IPv6:2607:f8b0:400d:c09::22f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41qCW26kCszF0WK
 for <openbmc@lists.ozlabs.org>; Tue, 14 Aug 2018 10:03:57 +1000 (AEST)
Received: by mail-qk0-x22f.google.com with SMTP id 191-v6so12250513qki.13
 for <openbmc@lists.ozlabs.org>; Mon, 13 Aug 2018 17:03:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PEJWTcUqnNIez0Yt4kFCHfNy69AFpCu1HpAjwjZNPK0=;
 b=S0LsTfU+vN9xEHsOLATyuKCdYGmkjOMU6xkS6df+WbSwnr6u5KW0kwZ8LFijNNKRPQ
 YbMc5TjD6m83dAfF2cFgLp2oooyY3fBQMAhu7YdJw111wg30pJAcT04faTQRCiBsIn23
 S5wb75v3q27qlq6bQbOof90vBynWMczXsCd4sUbByfu1a+ezhFqMPRVN01Ru7VAFGcpQ
 CKdw/mvCUZnv0oN60hWhcuLDyPeTxLughsv5nantLU8bUGSH5oVuErmUiXcYTPrJrNGj
 OeBTzuC2i6kX+mbnYDBZMKn/nLEXy4BPdZgTt5HW8h5/0SoNblfjxl9tLSlN019Hk2Bu
 p8VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PEJWTcUqnNIez0Yt4kFCHfNy69AFpCu1HpAjwjZNPK0=;
 b=ObTZ5BrMLdu1h77TsBbExRFcffPzD0EEY88dZ+IAnoTG00ctByv+Qo6X1ZlSTdhUrS
 34n9itky8yL23kU4Kxz3ayQ/rOMi91Tis6839MFllt+JK0cdZvFKR61j5dJZZYB1n2oB
 J5EwHDPbLzsuGWO7byPR5+KrvE+v/z/j0gWQmfcJDkon50/T5Nmd8YuHt6R+d6VIBsLu
 BYs1rVRa6xiy6PkiiUirKYg4myFxRmQjJiOu7MX/GG/Nhv2qFE5BUBd0XDVPcWYLqjPQ
 5mBVwmViXpY6WBlJS+Wbt9LS1DOZ3JhDNSnNxrSiQ9QDQZQRhKHRfxhLJKymJeXmnkio
 O4Gw==
X-Gm-Message-State: AOUpUlHCo35nMAvXzFYzOhvb9AFRxPqXMI3P75zXX4/GLpAXUXQMVE2A
 z5aNp3Zdd4oFSylfWawc0bsMPdb6TS6RBxQYkovjVQ==
X-Google-Smtp-Source: AA+uWPwOMJoZL+RuOTrXRGfcWE0WbuW08wD42RUWwQse3OOCfrzqWuGWQvYg+Z8keZrzUd0JSmxda+G3Q9zrC45fc7I=
X-Received: by 2002:a37:c394:: with SMTP id
 r20-v6mr17755404qkl.372.1534205034546; 
 Mon, 13 Aug 2018 17:03:54 -0700 (PDT)
MIME-Version: 1.0
References: <6c913a75b11ae03ef9298085ead69afe@linux.vnet.ibm.com>
 <0cf6b440-e3d0-c1f1-48e9-f0cd6d4eff4f@linux.intel.com>
In-Reply-To: <0cf6b440-e3d0-c1f1-48e9-f0cd6d4eff4f@linux.intel.com>
From: Emily Shaffer <emilyshaffer@google.com>
Date: Mon, 13 Aug 2018 17:03:42 -0700
Message-ID: <CAJoAoZnnt8qfH0H81phTZQdgwFM5KOZQjrrV6dQprWrD3-VgrQ@mail.gmail.com>
Subject: Re: Read-Only IPMI sensors
To: James Feist <james.feist@linux.intel.com>
Cc: Adriana Kobylak <anoo@linux.ibm.com>, openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="0000000000001977da057359f2be"
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
X-List-Received-Date: Tue, 14 Aug 2018 00:04:01 -0000

--0000000000001977da057359f2be
Content-Type: text/plain; charset="UTF-8"

host-ipmid also already supports read-only, in fact, adding writable
support was a pretty big work item last year. When you say data-driven
design do you mean the automatic discovery? I guess I'm a little confused
as to what exactly is missing for you.

On Mon, Aug 13, 2018 at 11:32 AM James Feist <james.feist@linux.intel.com>
wrote:

> On 08/13/2018 11:33 AM, Adriana Kobylak wrote:
> > There are a couple IPMI sensors that are not yet included in the
> > data-driven design of IPMI because they're intended to be read-only
> > (example: https://github.com/openbmc/openbmc/issues/2154).
> >
> > Some options to implement these:
> >
> > 1. Add support in sdbusplus for read-only properties and map these
> > sensors to a read-only d-bus property.
> >
>
> sdbusplus-asio already has support for read-only properties that you
> might be interested in using / duplicating:
>
> https://github.com/openbmc/sdbusplus/blob/master/sdbusplus/asio/object_server.hpp#L123
>
>
>
> > 2. Have a (json?) file with the sensor settings and have IPMI and any
> > other interested apps read the file directly to retrieve the sensor
> values.
> >
> > 3. Add read-only sensors to a d-bus object and override the "setter"
> > function to be a no-op to prevent the value from being modified.
> >
> > 4. Combination of above / other options.
> >
> > Thoughts?
> >
>

--0000000000001977da057359f2be
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">host-ipmid also already supports read-only, in fact, addin=
g writable support was a pretty big work item last year. When you say data-=
driven design do you mean the automatic discovery? I guess I&#39;m a little=
 confused as to what exactly is missing for you.</div><br><div class=3D"gma=
il_quote"><div dir=3D"ltr">On Mon, Aug 13, 2018 at 11:32 AM James Feist &lt=
;<a href=3D"mailto:james.feist@linux.intel.com">james.feist@linux.intel.com=
</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On 08/13/2018 11:33=
 AM, Adriana Kobylak wrote:<br>
&gt; There are a couple IPMI sensors that are not yet included in the <br>
&gt; data-driven design of IPMI because they&#39;re intended to be read-onl=
y <br>
&gt; (example: <a href=3D"https://github.com/openbmc/openbmc/issues/2154" r=
el=3D"noreferrer" target=3D"_blank">https://github.com/openbmc/openbmc/issu=
es/2154</a>).<br>
&gt; <br>
&gt; Some options to implement these:<br>
&gt; <br>
&gt; 1. Add support in sdbusplus for read-only properties and map these <br=
>
&gt; sensors to a read-only d-bus property.<br>
&gt; <br>
<br>
sdbusplus-asio already has support for read-only properties that you <br>
might be interested in using / duplicating: <br>
<a href=3D"https://github.com/openbmc/sdbusplus/blob/master/sdbusplus/asio/=
object_server.hpp#L123" rel=3D"noreferrer" target=3D"_blank">https://github=
.com/openbmc/sdbusplus/blob/master/sdbusplus/asio/object_server.hpp#L123</a=
> <br>
<br>
<br>
<br>
&gt; 2. Have a (json?) file with the sensor settings and have IPMI and any =
<br>
&gt; other interested apps read the file directly to retrieve the sensor va=
lues.<br>
&gt; <br>
&gt; 3. Add read-only sensors to a d-bus object and override the &quot;sett=
er&quot; <br>
&gt; function to be a no-op to prevent the value from being modified.<br>
&gt; <br>
&gt; 4. Combination of above / other options.<br>
&gt; <br>
&gt; Thoughts?<br>
&gt; <br>
</blockquote></div>

--0000000000001977da057359f2be--
