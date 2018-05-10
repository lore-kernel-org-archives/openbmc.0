Return-Path: <joel.stan@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400d:c0d::241; helo=mail-qt0-x241.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="fJYiuW8/"; 
 dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="Ki/8yLjr"; 
 dkim-atps=neutral
Received: from mail-qt0-x241.google.com (mail-qt0-x241.google.com
 [IPv6:2607:f8b0:400d:c0d::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40hHQ50mLmzF1Q0
 for <openbmc@lists.ozlabs.org>; Thu, 10 May 2018 12:35:24 +1000 (AEST)
Received: by mail-qt0-x241.google.com with SMTP id m9-v6so762892qtb.5
 for <openbmc@lists.ozlabs.org>; Wed, 09 May 2018 19:35:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=3UA/xRfzXxIrtckCQEiadWX6ex22fWerhZ8Co1S8PC0=;
 b=fJYiuW8/BOKEla2L/BF0T6nlIXHnBre31ZMEPDtTzko+jyBINogGNvTahtuyC9xVxH
 1379uFRDyF6Tc9pa4Qn1tau+cxSBviNQTB+osAI1ljIARGBarZhNHFw2v333DgqjOuIf
 qGJ+h/W3Iq8ARtNhr6L8RV/lxQlkgYOMMeUSiPLk2F36eW0F2hLZ1QIGcOq8IxEZNSVs
 2Cx77amRwZz+VjJ1kSaoYXrPqDp4T6qSo4D/GVRqy5cTPpCVFO4juLk7csEtV0vc2acI
 ttz7ph1LTsAGKxfKKNKVIX5FjiVS2gKeGVGRegMKq6q7f5ZTldqoXdH7mIReVNnJfdzT
 K1IA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=3UA/xRfzXxIrtckCQEiadWX6ex22fWerhZ8Co1S8PC0=;
 b=Ki/8yLjrokL/eKpctv3OHlBdY/OHhjoWL9Ww6MHm8XR9ftKjnBuQ1FvJR4vdKNl4zl
 B0CDMX7CqwYHe77rEn7iYFduiIrYk552GsMVndxnWtd9QaSw8jFl/YoRDRGw4qfC8i2H
 ILCB4/9caJ1BxXkYMVpiM3IZC28y10NE52vcI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc:content-transfer-encoding;
 bh=3UA/xRfzXxIrtckCQEiadWX6ex22fWerhZ8Co1S8PC0=;
 b=cHw2oeSD24lprFxt8AIVaW50PL+Z01xtogTp7NLIABGzxEYrX2ypmE585j5Bn2A5sn
 /FEwNxRisHpRvdhuKJK8A0onTY9/8t4qKQ1lbQxZpCJVnMBqIngx2x1qxQ4huh5VVYdt
 r0QXj2vS6UHkV8YLchxqn7q8w34D1nojLbXnhlxuuohtUxR7vzM+KneGZAfJoKuCE3z0
 0LFWWNf93YSsjfVGEV7GN9x6t4tgH4A0K2pOhZ95+5KtCg0bFPFassYMN7DJkhNxbtSs
 f4fE/jkZw7S1K9e3iGyaWRAc9RuYAfFI84jyhfvg24WyTODJk1ZYTTT0g9GwQ0V580S9
 yDDQ==
X-Gm-Message-State: ALQs6tDeRgk+fT+6Fs8s05Mt3RcNlXEbxQsJfiyiWqzPEy9lOJjsduJf
 gyqxT6M4cSqXVE6jr7D0gS2yqWapaNid9YrCMh0=
X-Google-Smtp-Source: AB8JxZoHQTL8eEoDjIqnKTzTRPNBbU2+b06VCBXhrHVE1eQFk/0HXR4QIK6aZzhFH4GQ5NAGbjAboRg0jzxksFtn24A=
X-Received: by 2002:ac8:2bb8:: with SMTP id
 m53-v6mr33520692qtm.340.1525919722175; 
 Wed, 09 May 2018 19:35:22 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.200.24.79 with HTTP; Wed, 9 May 2018 19:35:01 -0700 (PDT)
In-Reply-To: <1525917773.2419605.1366930024.0B69BF3D@webmail.messagingengine.com>
References: <20180504024313.19645-1-joel@jms.id.au>
 <1525917773.2419605.1366930024.0B69BF3D@webmail.messagingengine.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 10 May 2018 12:05:01 +0930
X-Google-Sender-Auth: xWM6E0ZE4XxLWqZKd_o-Q7zdQ0I
Message-ID: <CACPK8XfwhCEMoSZ=Wi_wz2xjZThNT1wBYinR2ki3NEHpCG6bgw@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.13] ARM: dts: aspeed: Move random number device
To: Andrew Jeffery <andrew@aj.id.au>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 Benjamin Herrenschmidt <benh@kernel.crashing.org>, Jeremy Kerr <jk@ozlabs.org>
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
X-List-Received-Date: Thu, 10 May 2018 02:35:26 -0000

On 10 May 2018 at 11:32, Andrew Jeffery <andrew@aj.id.au> wrote:
> On Fri, 4 May 2018, at 12:13, Joel Stanley wrote:
>> Move the node out from under the syscon/simple-mfd.
>>
>> Being a child of this node causes the driver to fail to probe, as
>> platform_get_resource returns NULL due to dev->num_resources being zero.
>
> Ugh. I'm frustrated by the schism that simple-mfd/syscon introduces. It l=
ooks like such an attractive solution right up until its not, when you have=
 existing drivers like this that you want to plug into MMIO space already c=
overed by the syscon/simple-mfd.
>
> Do we have a way out of this kind of mess?
>
> What about adding regmap support to the timeriomem_rng driver?

I'm sure that they would take patches, especially if it retains the
current behaviour. Given how little it's reading from the one
register, there are no concerns with overhead/performance.

In general, it would be good to not have to rewrite drivers in order
to use them. Is it a matter of allowing more than one device to bind a
of resource?
