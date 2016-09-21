Return-Path: <brendanhiggins@google.com>
Received: from mail-yw0-x22e.google.com (mail-yw0-x22e.google.com
 [IPv6:2607:f8b0:4002:c05::22e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sf12Y6VNzzDsfl
 for <openbmc@lists.ozlabs.org>; Wed, 21 Sep 2016 10:38:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b=XSA3Bwnt; 
 dkim-atps=neutral
Received: by mail-yw0-x22e.google.com with SMTP id t67so28251580ywg.3
 for <openbmc@lists.ozlabs.org>; Tue, 20 Sep 2016 17:38:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0TFtxVoJj5+p8OLerHdHlnIiMOb40Suo/V78dDdg56c=;
 b=XSA3BwntGrQneFhRxDapeR2nUJQkTa62pYQAXgS6pRb7kCkS81saSpxOVe2k4zkXqp
 FMmKmc8d4foi4GZNaZeNXyxC5+F/HzjK6vCSMmEGddKbuii5u5v/O1Sd790i2i4rTz8k
 xZOXfFtxlrWuqZ0jZJfQc+P/76bQQIwVUgjAJG9U6reXscw1Egx0UpXA9V/7L+hPSz3M
 SyNOCpGiBVgZTAM3SHHyg1VgXT7P16uS9J64Ndi7GnefoaQYB7dYCq5jobaQ/+I4fZkj
 0ea87cG1qGjk2NHkOdS/S1hR+N9+j11Mm4BCg3qhnpLmy7B+FGMbUihzj/LH+qbq5/gl
 K0FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0TFtxVoJj5+p8OLerHdHlnIiMOb40Suo/V78dDdg56c=;
 b=FsBm79BnjLAVUYtWLZi9yGgNtnOdiHoe1zv5oYkWgTvUDKP0isHiESf3z+JyHfmaHL
 Qciwjfo6F12P/k/5ZAGvU1LFyzcqkmhK9eRxsdyDfJDR51rHKrDsnpRKNWFeFoVFTA6X
 Xg8/WJWHf+x4kovNjwVTBduGQYuepewWX2OC7TSZSgcBlF6GWgXrpKkcPIGLz6ESpHRC
 IJi/UfZVyCb78g2jX+RWwnsSQIcqmTZbo0QJToatW9bl5PoVeP5wxe6hItw94NqaRUCI
 x9DziaaYQo9PcenmLqJxsCW0q4LR3HbLVREC3qlpLyQV6n53ZV+fLkXUgxOLnUtfd0Td
 qjbg==
X-Gm-Message-State: AE9vXwPnII9TKJnc+AEKnMSq4lWBc0Tl0R1gQeZokJPqwb0d8qGQEM37zCA0JtaywuQG0xb+Gu50mXugbVw5HBKl
X-Received: by 10.129.145.151 with SMTP id i145mr15886656ywg.35.1474418322761; 
 Tue, 20 Sep 2016 17:38:42 -0700 (PDT)
MIME-Version: 1.0
References: <CAFd5g46OwV7OEcLQmkyajxcDpy+fztAK3reo3iDcjkBOcBncBQ@mail.gmail.com>
 <20160913191412.5orurrahenhubsn2@asimov>
In-Reply-To: <20160913191412.5orurrahenhubsn2@asimov>
From: Brendan Higgins <brendanhiggins@google.com>
Date: Wed, 21 Sep 2016 00:38:32 +0000
Message-ID: <CAFd5g45pTpZME-GNfmHjWn--ZEX4O3in99EaviQVU2KmAZbjiA@mail.gmail.com>
Subject: Re: Supporting one IPMI request does not yield one response
To: Patrick Williams <patrick@stwcx.xyz>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary=94eb2c093e006154bd053cf9c4fe
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
X-List-Received-Date: Wed, 21 Sep 2016 00:38:46 -0000

--94eb2c093e006154bd053cf9c4fe
Content-Type: text/plain; charset=UTF-8

I did have a plan for a particular message type that would use the 0-N
response; I was planning on implementing the message as an OEM Group
extension, so I figured it would be acceptable to just follow the normal
procedure if an unknown OEM Group message is encountered. The other use
cases are bridging messages and the messages you mentioned, inventory and
oem-esel, could be handled in the same way.

As far as updating btbridged and any necessary firmware on the host side, I
figured that would have been assumed, sorry if that was not clear; again, I
just wanted to make sure that people were generally okay with this new
functionality on the OpenBMC side.

I will try to get an initial implementation out for review this week on the
ipmid side this week or next.

--94eb2c093e006154bd053cf9c4fe
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr" class=3D"gmail_msg">I did have a plan for=
 a particular message type that would use the 0-N response; I was planning =
on implementing the message as an OEM Group extension, so I figured it woul=
d be acceptable to just follow the normal procedure if an unknown OEM Group=
 message is encountered. The other use cases are bridging messages and the =
messages you mentioned, inventory and oem-esel, could be handled in the sam=
e way.<div class=3D"gmail_msg"><br class=3D"gmail_msg"></div><div class=3D"=
gmail_msg">As far as updating btbridged and any necessary firmware on the h=
ost side, I figured that would have been assumed, sorry if that was not cle=
ar; again, I just wanted to make sure that people were generally okay with =
this new functionality on the OpenBMC side.</div><div class=3D"gmail_msg"><=
br class=3D"gmail_msg"></div><div class=3D"gmail_msg">I will try to get an =
initial implementation out for review this week on the ipmid side this week=
 or next.</div></div></div>

--94eb2c093e006154bd053cf9c4fe--
