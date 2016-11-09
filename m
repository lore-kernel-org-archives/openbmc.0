Return-Path: <joel.stan@gmail.com>
Received: from mail-it0-x244.google.com (mail-it0-x244.google.com
 [IPv6:2607:f8b0:4001:c0b::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tDhcL6BPkzDvf5
 for <openbmc@lists.ozlabs.org>; Thu, 10 Nov 2016 10:05:54 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="OmGUbBfy"; 
 dkim-atps=neutral
Received: by mail-it0-x244.google.com with SMTP id n68so17644669itn.3
 for <openbmc@lists.ozlabs.org>; Wed, 09 Nov 2016 15:05:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=cpXMLyYmAUHpwJzeECdp69QOExQcpgRUalY7mdfFZHQ=;
 b=OmGUbBfyAk5HaRzSvRmEhwskFpYRep8goOyzQ2TzQMmIKtUefKIAgiD/cdL1rBW7cF
 c1+zlZmkJPc4AaBKNHk/5IKeUvUzJVAHhGVkk+ULUQ0wpVbjVWR7nIEM53aWHgXC4F3G
 IEAQm7q/ehnAQfOE+4djCrcEriXEwfMeTEcYboVYifs0N/kN8UQvx2ckRqUq/sKgJE36
 H9FdWmt3lI96tPSyaYDAkdVDVS2SEPZv4FCM8Mer0/81cUQGCcNg0O383agIo7NE1bzi
 DV5cytgtZqOZhM7PMHn5VkjNbfrJBzMB054eQ/WdepLuzfuJs6a+kqJ8Z7mqE8JHzHRT
 QAzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc:content-transfer-encoding;
 bh=cpXMLyYmAUHpwJzeECdp69QOExQcpgRUalY7mdfFZHQ=;
 b=cMtd/9b0GA8z7/E7vTjPjcKraBKgdb0yaoeK5JNE6txkygs7gfYf09oPVxk9mHrbL+
 gW+FVJYtgO3S1V5JgJBznvnzS74wx3S7IsfSLz4Ghslgy/3wqMe9VSA4CH+fUuq3ql1T
 5bWganjcQApeCtHZaNv6xn/nrpJWLbJnItI/Cmj9glUYrYhdURUqaBumCPlnW6fay/4C
 ZM6eAYTt/x1Le/Fmr3DHiGyjmyK9aeOIAk6+Z/2qnTRKNy8jC4rF+FD/jwrzYXNICG2y
 jOWchR3fa71YiNP9Urfzs5vEXwT1/GBVgD9CCUwJn0ssQ+SJv9zaAKuddSUWy7WJj9ZY
 rz5Q==
X-Gm-Message-State: ABUngvdDaDbntm/e7R5yckB+3Q540fjCLk1xx94SG2GPYg2YXrxV8PFwAQHI49K2QbT150n+cjbRR+SqJBJWPg==
X-Received: by 10.202.252.133 with SMTP id a127mr1375654oii.124.1478732753175; 
 Wed, 09 Nov 2016 15:05:53 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.182.97.41 with HTTP; Wed, 9 Nov 2016 15:05:32 -0800 (PST)
In-Reply-To: <1478679343-25354-2-git-send-email-clg@kaod.org>
References: <1478679343-25354-1-git-send-email-clg@kaod.org>
 <1478679343-25354-2-git-send-email-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 10 Nov 2016 09:35:32 +1030
X-Google-Sender-Auth: 4BJYNS-GfViwf7o23dxGmei5PEM
Message-ID: <CACPK8Xdc8zwap=X9sB+f7WQ63MpEHx=67Rgca_cMsLrJbk22mA@mail.gmail.com>
Subject: Re: [PATCH v2 linux dev-4.7 1/7] mtd: spi-nor: aspeed: fix setting of
 the register control value for writes
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
X-List-Received-Date: Wed, 09 Nov 2016 23:05:55 -0000

On Wed, Nov 9, 2016 at 6:45 PM, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
> The setting of the register control value for writes depends on the
> base value which was defined only if the mask applied to it changed
> the register control value.
>
> Fix that.
>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Reviewed-by: Joel Stanley <joel@jms.id.au>

> ---
>
>  I kept the info level because nothing wrong is happening. we are just
>  possibly changing an optimized value for a non optimized value

Okay, thanks for the explanation.

>
>  drivers/mtd/spi-nor/aspeed-smc.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
