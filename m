Return-Path: <joel.stan@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::744; helo=mail-qk1-x744.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="ndMWNJb7"; 
 dkim-atps=neutral
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43g7l31rl0zDqjZ;
 Thu, 17 Jan 2019 13:46:55 +1100 (AEDT)
Received: by mail-qk1-x744.google.com with SMTP id 189so5156438qkj.8;
 Wed, 16 Jan 2019 18:46:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=B4j/WuweH0wMxL+RODpScBf2L4ITsa+/ZzunIai8Y/4=;
 b=ndMWNJb7QvWxiFN6aMSNgjChjftJHxNGb2N5am20Zt7XOu4JU3cOpXldQSBFcxRaft
 3kDybIQBtpZONmus/afJeaEQI9SzC8nZ92FcyabaKSlvn4mPt411lr9giwyRi+2ep/EF
 WnCM2PZqx/MobKE62RRhgqsT9EsPsNS9PQvG8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=B4j/WuweH0wMxL+RODpScBf2L4ITsa+/ZzunIai8Y/4=;
 b=oA7pyyogpH2OXyOWZytkCqq71BSQrvCctXNKafOg5o1qmjDUFrfPcHm0RQPRIUn9c3
 X0ETQdTv1aSXc3FAddqKCjEoJUHezS3PXd3SgB45RXD9lwXPwkFTSZm45YeVCyTWpvQR
 NCcy38Z2RjHgJ8AqVne9TgPw7SK+s80M08dHudyMNq6ELvHAZpgVHZUwfNFhRvJyO7J+
 8/riOIAGJrvZZvXPqZdvSl/57fJcEICvEJQ9ZAr/aizqAecv6fCvqadTazplHOYQl121
 EydCgPcFvCeOytQ6850oNATHpUi1Np2RCiGJ1auPIOyyAZkTc+SShxpyp6xsdhGEz0bw
 fAew==
X-Gm-Message-State: AJcUukcniCUSG4TkuD8EiekWzFAax7YdoOzAd811xp4dscIUCYqoHEgY
 u6nGwIPtU8EfRABS9S3eLiH2coLv5VoULpVOVqU=
X-Google-Smtp-Source: ALg8bN4g6CHYobJ+o57LHwHQTioIoweDmYs1sEQbf7J1qINqKMWVyLA9iuNyxJeLx02SEqS/s3dBOJQ5a+0tigglcWI=
X-Received: by 2002:a37:781:: with SMTP id 123mr9208486qkh.231.1547693212458; 
 Wed, 16 Jan 2019 18:46:52 -0800 (PST)
MIME-Version: 1.0
References: <20181217200405.2904551-1-vijaykhemka@fb.com>
In-Reply-To: <20181217200405.2904551-1-vijaykhemka@fb.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 17 Jan 2019 13:46:39 +1100
Message-ID: <CACPK8XcbXso=13nRC3xM62RnWfEKnFcZpaBA4OAB7mad4mdGGg@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] ARM: dts: aspeed: Add sensors devices for Facebook
To: Vijay Khemka <vijaykhemka@fb.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Andrew Jeffery <andrew@aj.id.au>, devicetree <devicetree@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-aspeed@lists.ozlabs.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 "openbmc @ lists . ozlabs . org" <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
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
X-List-Received-Date: Thu, 17 Jan 2019 02:46:55 -0000

On Tue, 18 Dec 2018 at 07:04, Vijay Khemka <vijaykhemka@fb.com> wrote:
>
> Added ADC and other sensor devices in Facebook Tiogapass device tree.
>
> Signed-off-by: Vijay Khemka <vijaykhemka@fb.com>

Applied to the aspeed tree for 5.1.

Cheers,

Joel
