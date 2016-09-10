Return-Path: <brendanhiggins@google.com>
Received: from mail-ua0-x233.google.com (mail-ua0-x233.google.com
 [IPv6:2607:f8b0:400c:c08::233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sWG4m3L8qzDqXr
 for <openbmc@lists.ozlabs.org>; Sat, 10 Sep 2016 11:02:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b=N1+yWiq/; 
 dkim-atps=neutral
Received: by mail-ua0-x233.google.com with SMTP id b7so81468423uab.3
 for <openbmc@lists.ozlabs.org>; Fri, 09 Sep 2016 18:02:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=sajIU+r2U30JU/2b+C5sw5kr9YDfbUPLezlcYlyAiTk=;
 b=N1+yWiq/T6OGjF5W1jbVW0ygtSkELK0xF35XrWZxLx/+kE/LPQo31LQSr6USVitkQW
 pWU3GjXw4XDVtjUlfn2c2q65RyXwo5/eweJM2Tssa/6/edpf42iws0nwAyWSJyUTh6vN
 RrV+owiKWcPRocUUMKjNvf/2fFMmXPPhmuj/81WiwPhA62HzHi2bki3720nh8hkYgL/7
 yj4zAH7ffP2ZjYkXO2jloJVv74FIM6CkgBrFJrAz3zNi+CRsGpHBqaK1FYCN8WpMQ2T/
 M8HSqPAoGcBIH4fngJvi0KK1JU5xEEtP7CzfastmybsEg2bJ9y+U/tl8FvIkJUn87oCS
 oxdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=sajIU+r2U30JU/2b+C5sw5kr9YDfbUPLezlcYlyAiTk=;
 b=eghSBQlIl4tuuaV1kUk0i1ZySnVMj/afR7NlFLVKxjhlmxCJhLXbQe5iwv5YqwNSOZ
 te2sHgBuYke2MowSWp5idR1NLz11H5gawRv0lRBXIrfwt7269cAawLy19Ix2ldBokt1C
 BJR1e3xH4vwx0AytvYLyE85UKmlJt1jgq/klXOZ34RLaT4abWuj9urt7wo/6ZSpqNGSE
 trSd7/gpk29OUFqgZzys1XymVSIMAo7d8UQNNKG7cX2JqI2P9V9NW1Qz907l6vrVVTj2
 bHwFddG2Y0lFPhTY3iUdl5DxCsvpmsE46jln+//8ebacqalHbLbLdTkhSZmQ7cxcRpbU
 KWKQ==
X-Gm-Message-State: AE9vXwPA3fRfUqWSuen0ZFbCw7oOSS39v7j8NS3htJsPiid1FVDIvAN66fyHd2oMsqvv8yLIMcHXz6bc0effZXkT
X-Received: by 10.176.6.6 with SMTP id f6mr4617544uaf.46.1473469333080; Fri,
 09 Sep 2016 18:02:13 -0700 (PDT)
MIME-Version: 1.0
From: Brendan Higgins <brendanhiggins@google.com>
Date: Sat, 10 Sep 2016 01:02:02 +0000
Message-ID: <CAFd5g46OwV7OEcLQmkyajxcDpy+fztAK3reo3iDcjkBOcBncBQ@mail.gmail.com>
Subject: Supporting one IPMI request does not yield one response
To: patrick@stwcx.xyz
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary=94eb2c0481f82fcc87053c1cd0a8
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Sat, 10 Sep 2016 01:02:18 -0000

--94eb2c0481f82fcc87053c1cd0a8
Content-Type: text/plain; charset=UTF-8

Hello,
The reason I am interested in having support for not requiring one response
to be tied to one request is because I am interested in multiple responses
being associated with a single request. In particular, I am interested
adding an OEM Group extension that allows arbitrarily large payloads to be
broken up across multiple Block Transfer messages.

I have a prototype for this OEM Group extension that I have tested on the
Aspeed 2500 EVB; there are some changes that need to be made to the handler
code in phosphor-host-ipmid to make it work, but nothing that seemed to
have any potential for controversy other than allowing a single request to
solicit none-to-many responses. There are other ways to make this work, but
this seemed to be the most palatable to me for the reason that it generates
less traffic than having to send a dummy request to get each of the
responses after the first one or using something like SMS Attention. I also
thought that the OpenBMC community might find supporting one request
soliciting multiple responses to be interesting because it would add the
capability to support IPMI Message Bridging as it requires sending two
responses for a single request (see '6.13.4 Bridged Request Example' in the
IPMI spec).

The OEM Group extension I mentioned could be thought of as a transport
layer over IPMI; it is something that I would like to get some more
feedback on later at which time I will send a more specific email detailing
how it works. Right now, I am just interested in whether there is any
interested in allowing a single IPMI request to solicit none-to-many
responses.

Feedback is greatly appreciated!

Thanks!

--94eb2c0481f82fcc87053c1cd0a8
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr" class=3D"gmail_msg">Hello,<div class=3D"g=
mail_msg"><span style=3D"line-height:1.5">The reason I am interested in hav=
ing support for not requiring one response to be tied to one request is bec=
ause I am interested in multiple responses being associated with a single r=
equest. In particular, I am interested adding an OEM Group extension that a=
llows arbitrarily large payloads to be broken up across multiple Block Tran=
sfer messages.</span><br></div><div class=3D"gmail_msg"><br></div><div clas=
s=3D"gmail_msg">I have a prototype for this OEM Group extension that I have=
 tested on the Aspeed 2500 EVB; there are some changes that need to be made=
 to the handler code in=C2=A0phosphor-host-ipmid to make it work, but nothi=
ng that seemed to have any potential for controversy other than allowing a =
single request to solicit none-to-many responses. There are other ways to m=
ake this work, but this seemed to be the most palatable to me for the reaso=
n that it generates less traffic than having to send a dummy request to get=
 each of the responses after the first one or using something like SMS Atte=
ntion. I also thought that the OpenBMC community might find supporting one =
request soliciting multiple responses to be interesting because it would ad=
d the capability to support IPMI Message Bridging as it requires sending tw=
o responses for a single request (see=C2=A0<span style=3D"line-height:1.5">=
&#39;6.13.4 Bridged Request Example&#39; in the IPMI spec).</span></div><di=
v class=3D"gmail_msg"><span style=3D"line-height:1.5"><br></span></div><div=
 class=3D"gmail_msg">The OEM Group extension I mentioned could be thought o=
f as a transport layer over IPMI; it is something that I would like to get =
some more feedback on later at which time I will send a more specific email=
 detailing how it works. Right now, I am just interested in whether there i=
s any interested in allowing a single IPMI request to solicit none-to-many =
responses.</div><div class=3D"gmail_msg"><br></div><div class=3D"gmail_msg"=
>Feedback is greatly appreciated!</div><div class=3D"gmail_msg"><br></div><=
div class=3D"gmail_msg">Thanks!</div></div></div>

--94eb2c0481f82fcc87053c1cd0a8--
