Return-Path: <brendanhiggins@google.com>
Received: from mail-qt0-x234.google.com (mail-qt0-x234.google.com
 [IPv6:2607:f8b0:400d:c0d::234])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tCMvr3cF2zDsxW
 for <openbmc@lists.ozlabs.org>; Tue,  8 Nov 2016 06:29:43 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="OhWaibmr"; 
 dkim-atps=neutral
Received: by mail-qt0-x234.google.com with SMTP id n6so94096977qtd.1
 for <openbmc@lists.ozlabs.org>; Mon, 07 Nov 2016 11:29:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=9ZATReL5MBmdy0AAl53UkIC5sohndnR1+os7d6pfPgM=;
 b=OhWaibmrCZixl/70jcfnfsHLBdEo/J9FXtyvexU1jbHZGsI7EFvsl7lM6fe/Bf5lME
 vN4cVo/423TfXMxxyUvEBkGZ8UXtzI6uKpo7/E3SDTvIJ7d2lOt3z3ZT8fqxaCTZOE7U
 7HY8LcSorj+M609T1rIQGUV8iQPCg2eYWcwu1fYqmxecbBp50MfhMS77b8vw84ewIOcY
 t7JED04KMq1ntipNmj/5UJgbPypw94PscAiXDnwzis/HZiS5yp0MHXiYWrn12pjDUM5s
 2QG+aJuAgZPm4Nj3DtPyKa6lTfLupb9GGXX64RwTWtQZ+LGSnufb82NY6bxU08B1Z/DC
 ndaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=9ZATReL5MBmdy0AAl53UkIC5sohndnR1+os7d6pfPgM=;
 b=R0toX3Ij7//tmOUSzf4T8KziQnPCwDahdXRm8vMgYVidi65C2V+cS1oIAb+AyaigfL
 kvRx1D5URNEVZNJZoRgUuZcPfU84bOr4D5Q7Kt51j4e3lF+aAS6dvG4URR/C7VAixhNp
 1TxlALwg54fUH269hows5R8dLMrzTiEDlnIAAQZX0C56XflIfcjylHFzglZSD63YzJoM
 cuvyZB9G2je2P9gyX+fUN4BNnBLsfpC3SuarUzpihaJTZbHju6pQGkR5ElANzrA9nFSd
 3Ao/qq6TiSTAcJRgcrMlETId3uLNcw1ys2hlS0fa2CUKULMEwYUlYhMpmhyT5Rjnbk1y
 sZzQ==
X-Gm-Message-State: ABUngvct7TfnSW6iLiVtwK0aJV/eWCE0Z95G575nnp7belYN1vslwWZ8u3FcEIdCjz614pVxwbekSP1Y24wmM76a
X-Received: by 10.237.50.129 with SMTP id z1mr8575777qtd.158.1478546981428;
 Mon, 07 Nov 2016 11:29:41 -0800 (PST)
MIME-Version: 1.0
Received: by 10.12.137.220 with HTTP; Mon, 7 Nov 2016 11:29:40 -0800 (PST)
In-Reply-To: <20161107150257.ug6zvs4v656cesep@asimov>
References: <1477465067-19034-1-git-send-email-clg@kaod.org>
 <1477465067-19034-8-git-send-email-clg@kaod.org>
 <1478132769.728.3.camel@gmail.com>
 <20161103182300.wt2lyseogigfxqfn@asimov>
 <53954820-3eaf-56c6-0a4c-9347ff4dc358@kaod.org>
 <20161104015543.GD17105@heinlein.lan>
 <c1423337-705b-5d24-4205-c9ce8c32f1f4@kaod.org>
 <CAFd5g45PHWivKg17TRofahmtpZiTP8eWpBVrds=XB1EBh1t7QA@mail.gmail.com>
 <66e47401-a567-c100-2a92-ca2ff32023a2@kaod.org>
 <20161107150257.ug6zvs4v656cesep@asimov>
From: Brendan Higgins <brendanhiggins@google.com>
Date: Mon, 7 Nov 2016 11:29:40 -0800
Message-ID: <CAFd5g45UOpJ8-3o-upx8jxN2hVDxh8Gkw6_+EbjzNKqaxsc-sw@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.7 7/8] ipmi: maintain a request expiry list
To: Patrick Williams <patrick@stwcx.xyz>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: Cyril Bur <cyrilbur@gmail.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary=94eb2c1252589d13550540bb0b3c
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
X-List-Received-Date: Mon, 07 Nov 2016 19:29:45 -0000

--94eb2c1252589d13550540bb0b3c
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Patrick, you are correct.

The { Seq, Command, NetFn } set does not necessarily uniquely identify a
message. The the OEM/Group extension messages as defined in the IPMI v2.0
Specification Document Revision 1.1, Section 5.1 Network Function Codes,
Table 5, under the name OEM/Group defines unique message endpoints by the
following set: { NetFn, Payload{0, 1, 2}, Command }; where Payload{0, 1, 2}
are the first three bytes of a message payload.

In addition, I am working on an OEM/Group extension that would allow a
single transaction to take place across multiple messages, and in
particular would allow multiple IPMI requests to be sent, potentially only
sending (a) response(s) at the end of the transaction; in particular, this
would allow the following:

Master     | Slave
Request -> |
Request -> |
Request -> |
           | <- Response
           | <- Response

Where Request and Response have the same sequence number. Note: the change
I am making would also make the above example valid if there were only one
request and two responses.

@C=C3=A9dric I see two remedies for your patch to allow this:

1) Allow users to opt out of the expiry list.

2) Update the keep alive list when *either* a new request or a new response
is sent with a given sequence number (change the list to be a hashmap of
sequence numbers to timeouts).

I will try to get a design doc for discussion describing this extension out
hopefully sometime this week; I think that might clear some things up.

Thanks!

--94eb2c1252589d13550540bb0b3c
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Patrick, you are correct.<br><br>The { Seq, Command, NetFn=
 } set does not necessarily uniquely identify a message. The the OEM/Group =
extension messages as defined in the IPMI v2.0 Specification Document Revis=
ion 1.1, Section 5.1 Network Function Codes, Table 5, under the name OEM/Gr=
oup defines unique message endpoints by the following set: { NetFn, Payload=
{0, 1, 2}, Command }; where Payload{0, 1, 2} are the first three bytes of a=
 message payload.<br><br>In addition, I am working on an OEM/Group extensio=
n that would allow a single transaction to take place across multiple messa=
ges, and in particular would allow multiple IPMI requests to be sent, poten=
tially only sending (a) response(s) at the end of the transaction; in parti=
cular, this would allow the following:<br><br>Master =C2=A0 =C2=A0 | Slave<=
br>Request -&gt; |<br>Request -&gt; |<br>Request -&gt; |<br>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0| &lt;- Response<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0| &lt;- Response<br><br>Where Request and Response have the sa=
me sequence number. Note: the change I am making would also make the above =
example valid if there were only one request and two responses.<br><br>@C=
=C3=A9dric I see two remedies for your patch to allow this:<br><br>1) Allow=
 users to opt out of the expiry list.<br><br>2) Update the keep alive list =
when *either* a new request or a new response is sent with a given sequence=
 number (change the list to be a hashmap of sequence numbers to timeouts).<=
br><br>I will try to get a design doc for discussion describing this extens=
ion out hopefully sometime this week; I think that might clear some things =
up.<br><br>Thanks!<br></div>

--94eb2c1252589d13550540bb0b3c--
