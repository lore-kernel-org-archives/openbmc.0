Return-Path: <joel.stan@gmail.com>
Received: from mail-yw0-x243.google.com (mail-yw0-x243.google.com
 [IPv6:2607:f8b0:4002:c05::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3whk7G1cLbzDqL0
 for <openbmc@lists.ozlabs.org>; Tue,  6 Jun 2017 17:38:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="KqaTSvXg"; 
 dkim-atps=neutral
Received: by mail-yw0-x243.google.com with SMTP id w143so2976827yww.1
 for <openbmc@lists.ozlabs.org>; Tue, 06 Jun 2017 00:38:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=oe6IfcXrMF7PM4rK3tS6seWFaaGVbvJzpuEV/h+54u4=;
 b=KqaTSvXg44A5G0VyTUCuYbrNlf/ZMfd2tbSZF+cYPYYF0fpxauyXJ3awbAgs6WerEH
 a1CJK/nH5jiG7s4jYZgus9ofVanmQwMpq68PqBJRzBJrKsVaFEeXnMVGAArOUw7kOH/N
 xvQubVs4nxFPJ9EEuJjyoXOJhRl4alAXEdmhEvctZTa2wf5CilCbmwuup4hOUNubXmtN
 2Oq+0Z8kfYGbFOcgtWAvFouHdHjK8AmZW9ozIyH8eXZ4JrH4DpXtEqcOh5koByva4Fo9
 VhILgG5B+N3HFzg6afI7v+QY2C5zDXa6J2+DZ5B4M4x424nFBkJcS5M/wJJ9HTlHAOHH
 C0Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=oe6IfcXrMF7PM4rK3tS6seWFaaGVbvJzpuEV/h+54u4=;
 b=i3gfH8VXPQrrddxm3S/wSXChszOHqGEv5AnLZooPve00qITQiK3XMP2MyoETy1QuIk
 V7H8N9bj5dV1vEQARVkNsxgjwSodh+O90ZgmtSOWxzU9TUqKS7qdHG4ytRwOcgZ4YyZf
 rfRKspEipzBfxRMKePMs9KgZAAfqF9Mp6iixlme1W8NCpJlCf2nGLitIEMnAhSyQ54cv
 CM3ncpIj2ue80bdh6i1kLW8+vA90KLmv/u4GwOGXWZyG31XqlE2x2Szbq/ZB1kxBM/6v
 /R0WrTxPpWAQOUfw2mTtVp5/AuD1MQr836EMwKHYAY5MymYr9zgtq+FuI+56LxdkoqL5
 1NKA==
X-Gm-Message-State: AODbwcAQEfxTaCT+L18Rp9FY1qZ/nTnxn1QcGbdGJD0mbeA1yn6UWYsS
 2f+J2+1JVnzEPXiwEQIo78XDxqX8io0FTqk=
X-Received: by 10.13.243.133 with SMTP id c127mr1777914ywf.43.1496734679181;
 Tue, 06 Jun 2017 00:37:59 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.174.2 with HTTP; Tue, 6 Jun 2017 00:37:38 -0700 (PDT)
In-Reply-To: <1496650682.8159.26.camel@aj.id.au>
References: <20170505024227.30962-1-andrew@aj.id.au>
 <1496650682.8159.26.camel@aj.id.au>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 6 Jun 2017 17:07:38 +0930
X-Google-Sender-Auth: ONmBDUvCWcpb72AiXz0Sm8OUUhw
Message-ID: <CACPK8XcMEREexL-ODXE8jMCT=V3f8Wcw6Kdzy=hPmmV801UYxA@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.10 v3 0/3] Clean up mach-aspeed/aspeed.c
To: Andrew Jeffery <andrew@aj.id.au>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>, 
 ken.th.liu@foxconn.com, john.hc.wang@foxconn.com
Content-Type: text/plain; charset="UTF-8"
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
X-List-Received-Date: Tue, 06 Jun 2017 07:38:02 -0000

On Mon, Jun 5, 2017 at 5:48 PM, Andrew Jeffery <andrew@aj.id.au> wrote:
> On Fri, 2017-05-05 at 12:12 +0930, Andrew Jeffery wrote:
>> Hi all,
>>
>> Here's v3 of the series cleaning up the board file given functionality we now
>> have in the tree. Between patches acked and applied from v1 and v2, there's
>> only Barreleye left. I've dug into the archives and Cc'ed Ken and John so they
>> can provide feedback if they have availability.
>>
>> A slip of the fingers meant that v2 didn't actually get Cc'ed to the list, so
>> apologies for that. Xo kindly Cc'ed his replies so the acks at least saw the
>> light of day.
>>
>> Again, the controversial patch is the debounce patch for BMC_PWBTN_IN_N, which
>> changes how the GPIO is exposed to userspace (and so needs a corresponding
>> userspace update). I'm hoping Brad can give feedback or start the discussion to
>> coordinate the userspace change.
>>
>> Cheers,
>>
>> Andrew
>>
>
> Joel, I'd like to see at least the first two patches taken. Hopefully
> some of the GPIO work that Brad was involved in can be applied to the
> Barreleye userspace so we can also take the third patch.
>
>> Andrew Jeffery (3):
>>   aspeed: barreleye: Remove unnecessary GPIO configuration
>>   aspeed: barreleye: Passthrough debounce isn't required
>
> Take the above two with some testing.

Those two have been merged into 4.10. They are not part of the kernel
bump I sent today, but will be part of the next.


>>   aspeed: barreleye: Debounce BMC_PWBTN_IN_N through devicetree
>
> Take this one once we we're ready in userspace.

Cool. Is there a ticket open to track that work?

Cheers,

Joel
