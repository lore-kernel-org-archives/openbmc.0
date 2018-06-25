Return-Path: <joel.stan@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400d:c0d::242; helo=mail-qt0-x242.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="aWWxDMo2"; 
 dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="WAqqqqXf"; 
 dkim-atps=neutral
Received: from mail-qt0-x242.google.com (mail-qt0-x242.google.com
 [IPv6:2607:f8b0:400d:c0d::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41DcTz2vMbzF189
 for <openbmc@lists.ozlabs.org>; Mon, 25 Jun 2018 15:01:58 +1000 (AEST)
Received: by mail-qt0-x242.google.com with SMTP id c5-v6so145119qth.5
 for <openbmc@lists.ozlabs.org>; Sun, 24 Jun 2018 22:01:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=DMFHvBz0Av+O1m/Rsp2SpyeClXPCZXH9Gn8DjkxCUsk=;
 b=aWWxDMo2OIcYMZqa8+M7JHL8UJVskoMD8u/JRY+QAQ+Ouzyc8/0o39K5i6cFcCgJ4X
 TV3BAqLX+fG2847ZiX3hMJxYFbjtnUOgREXk89XdYoZ2Ge3cBBSJqmQajsdWRMYVaIPN
 Mtbyepv12DAZLkQZOSMIfcAU9V061j2Xx2Q14SntuZ5ZVjFUVxjNxdGRCaBjyPpJ2CKS
 9OEjMIK33nT4IGF+VHs9OFfZTK++qSAoS7zzY/vTrUJJlWGxu/DxkKpPbe5MZprV5dm1
 +wtmtlRuevexdvibqwVXlbQ0J9HLqt24OHNcmhy0l7SmKpAXrBOZCSZC46E2c3AlK6Ol
 xbqw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=DMFHvBz0Av+O1m/Rsp2SpyeClXPCZXH9Gn8DjkxCUsk=;
 b=WAqqqqXf2VmDRkmXWWL7PrSsc7ssDNIIqIMk6Zh08l2X5DUqDjc5OkGnMJYjedtzOw
 fc9ZHOMFnFOQIoWpxuKRkvbK66eOd3nOY48suk7vTRnV1ppC7c8/xM464CNNeS5qpq9K
 cEKqDtagHJCrGdU5VdpEohwWm8eWJIyDpHXxI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc:content-transfer-encoding;
 bh=DMFHvBz0Av+O1m/Rsp2SpyeClXPCZXH9Gn8DjkxCUsk=;
 b=A11ekIP15rUkSDq0wJovPNJy7HXxr/PeLM8Brku6ve8zlkmy8blSwGxaH0R6nfMQAH
 DY0yRsppfrAh/J3pfiH783YUck0jU9xevcqtbOOgmGLaUhd9jeJ1NGUmj4B6/lg2VPZW
 H07jG6ZE4Dxrzcjt219foq6yAbj0/nZ6nGkarA5YmxXFui43vHhWJ37SpsSJcrhcOF0N
 pF7pWtZEkOYO8cpDG4I2c/K+jgM2m75jpRMzjLqaaCXFF+0FQLcnDyRbMox5ENWc+fsn
 vZslKzJIBfRaNwXaSiwSDpWFSbfASeXtsyBUbfc2UTQd6VqZ9kvgx16nFVTx+OScEjTj
 pFcw==
X-Gm-Message-State: APt69E1bhhbD3qS75nyBWcdBMOgELehVrOaykVx9haBRoDvJrEU5WKZN
 rdcSbRaMF3fqbG1l9WkSt6bHPu1vur33KnVaDzc=
X-Google-Smtp-Source: AAOMgpeEyfReMh7nkBXlLewjCpebdgCxelKFmP2E42EeF07nsFlExgqsBw+mCZ9eeXLQE2FaCKEYIEyLkO6DlJLOek0=
X-Received: by 2002:ac8:65d1:: with SMTP id
 t17-v6mr9873549qto.347.1529902916293; 
 Sun, 24 Jun 2018 22:01:56 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 2002:ac8:169d:0:0:0:0:0 with HTTP; Sun, 24 Jun 2018 22:01:35
 -0700 (PDT)
In-Reply-To: <e4568bc9-1221-06e3-e988-dfe45f168710@kaod.org>
References: <20180622070937.21498-1-clg@kaod.org>
 <20180622070937.21498-2-clg@kaod.org>
 <CACPK8XenvZXcciV_sY-f4ZEjV+H1UtA1Ef5JYnvr2CKwM3NXtw@mail.gmail.com>
 <e4568bc9-1221-06e3-e988-dfe45f168710@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 25 Jun 2018 14:31:35 +0930
X-Google-Sender-Auth: PrfnJZvsiDts-iZrJzlQxSUGwZc
Message-ID: <CACPK8XfXr2M-AAfDGQ6r_gJi2o-B=C6AZBs0CzS3_XuuG4EC4Q@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.17 v2 1/2] ARM: dts: aspeed: Add
 "spi-max-frequency" property
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Andrew Jeffery <andrew@aj.id.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
X-List-Received-Date: Mon, 25 Jun 2018 05:02:00 -0000

On 25 June 2018 at 14:23, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
> On 06/25/2018 05:40 AM, Joel Stanley wrote:
>> Hi Cedric,
>>
>> On 22 June 2018 at 16:39, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>>> Keep the FMC controller chips at a safe 50 MHz rate and use 100 MHz
>>> for the PNOR on the machines using a AST2500 SoC.
>>>
>>> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
>>> ---
>>>  arch/arm/boot/dts/aspeed-ast2500-evb.dts         | 2 ++
>>>  arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts    | 2 ++
>>>  arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts     | 2 ++
>>>  arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts | 3 +++
>>>  arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts       | 2 ++
>>
>> The changes look good. I notice you've only modified the openpower
>> platforms and the evb. Is there a reason we don't do this for all of
>> the ast2500 boards?
>
> When I started working on this patchset, I am not sure these boards
> existed yet. Should we just bump the max freq to 100MHz for all ?

Yes, I think that's a good option.

What are they symptoms when the speed is increased too much?
