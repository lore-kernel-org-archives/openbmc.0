Return-Path: <peter.maydell@linaro.org>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linaro.org
 (client-ip=2607:f8b0:4003:c06::241; helo=mail-oi0-x241.google.com;
 envelope-from=peter.maydell@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.b="MS25cc6L"; 
 dkim-atps=neutral
Received: from mail-oi0-x241.google.com (mail-oi0-x241.google.com
 [IPv6:2607:f8b0:4003:c06::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41RLGH4pLLzDr0X
 for <openbmc@lists.ozlabs.org>; Fri, 13 Jul 2018 01:58:59 +1000 (AEST)
Received: by mail-oi0-x241.google.com with SMTP id k12-v6so56686794oiw.8
 for <openbmc@lists.ozlabs.org>; Thu, 12 Jul 2018 08:58:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=zTKyd57y3rqhRDnuEaxIzs4Bl+6HpWZoEzcyiaQKnZ4=;
 b=MS25cc6LqfXmSfuKAw3KV7XKK4qZOyrDZsgd4fa4E4A6u7V/ob8T32b63UTRrfISqf
 hwD9DJ2KvL7+xs8n02YPn8spZ+8KwKMlDMCUloqVFSRazPvTS9JYPSo1rkRS3hYMqFZc
 9hpcDSiZ/Fk/yUtIT9w0VW0di3NJDlOi4EOIc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=zTKyd57y3rqhRDnuEaxIzs4Bl+6HpWZoEzcyiaQKnZ4=;
 b=DbZ+d0pdK3/gStO8M5yhjM2NfjA+nv8ju9FLb0B9lmiaay17pzocDg/Q4uRTqAaSRD
 q9AbLwEalktaqQ1CmaQR8IDL/EaRkDHQ+ldsDkHTAIFHteSywk2K2lQfXPOq6y+LZHa3
 qKcJbzTqezuQ4V/Wjhuyi/s7i+Bb1CtiYQESAl0CtuwJ9DvyVbquwg1DDTrqSKTTYXbU
 jcuQiTidKm4yCwE8Bog3bb6ig5LzpoPfefivBw5Oc0ntzkwOUAei/6W4lOfP+DIUd08h
 JxnMjNz/HhbRUVUZGjOzhZsT636gdsgT54g4p3PwUxX3EPu04LGdqLbsZzK0Mji8NlWU
 XqAA==
X-Gm-Message-State: AOUpUlFARsnBiUb4HndaQvbjv7smDfwpjRLSwXspetoU2WNWLIQMaNCg
 LT8kTwkxtEPREzIDfXzI/EhesptPSZnNrQs+Hhm5oQ==
X-Google-Smtp-Source: AAOMgpcSFt/XeAx4o/IeIAbFfKA94LWSZypidt+BfUqCru9uCcAOybe0LVyi9hC8D4uypLH2H0jTZ6eL5LapYFabFv8=
X-Received: by 2002:aca:a982:: with SMTP id
 s124-v6mr3110845oie.80.1531411137544; 
 Thu, 12 Jul 2018 08:58:57 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:5c8a:0:0:0:0:0 with HTTP; Thu, 12 Jul 2018 08:58:37
 -0700 (PDT)
In-Reply-To: <20180709143524.17480-1-andrew@aj.id.au>
References: <20180709143524.17480-1-andrew@aj.id.au>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 12 Jul 2018 16:58:37 +0100
Message-ID: <CAFEAcA9GHFwscBzRGRbqAN+nWWYYbSZB-M0Kt+r=fFFG3xfm8w@mail.gmail.com>
Subject: Re: [PATCH] aspeed: Implement write-1-{set,
 clear} for AST2500 strapping
To: Andrew Jeffery <andrew@aj.id.au>
Cc: QEMU Developers <qemu-devel@nongnu.org>, Joel Stanley <joel@jms.id.au>, 
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 qemu-arm <qemu-arm@nongnu.org>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
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
X-List-Received-Date: Thu, 12 Jul 2018 15:59:04 -0000

On 9 July 2018 at 15:35, Andrew Jeffery <andrew@aj.id.au> wrote:
> The AST2500 SoC family changes the runtime behaviour of the hardware
> strapping register (SCU70) to write-1-set/write-1-clear, with
> write-1-clear implemented on the "read-only" SoC revision register
> (SCU7C). For the the AST2400, the hardware strapping is
> runtime-configured with read-modify-write semantics.
>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> ---

Hi -- is this a bugfix suitable for 3.0, or something you'd
like to wait until 3.1 ? The commit message sounds like a bugfix...

thanks
-- PMM
