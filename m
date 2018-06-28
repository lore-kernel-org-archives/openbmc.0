Return-Path: <joel.stan@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400d:c0d::22c; helo=mail-qt0-x22c.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="ogJhnZ0Z"; 
 dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="a5aWoOeT"; 
 dkim-atps=neutral
Received: from mail-qt0-x22c.google.com (mail-qt0-x22c.google.com
 [IPv6:2607:f8b0:400d:c0d::22c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41GRF167jhzF1MV;
 Thu, 28 Jun 2018 14:12:05 +1000 (AEST)
Received: by mail-qt0-x22c.google.com with SMTP id c5-v6so3625724qth.5;
 Wed, 27 Jun 2018 21:12:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=ySM3sy1aI/8htuK6R6KLVEKvwLzW4CHXfLlasZ79954=;
 b=ogJhnZ0Zho/X+6a6HN036pqO6n4EcoaoxBsursA+7F19ZR8KZ9MMCRXkKLv6rCjwC8
 TYD9j324MkhEdAcvv55EbykBsxflF74k+ifBgc9CAz5wVi8wKH5hqSGtwwCkhrIjmPba
 s0M/UKoj33IVr5HDN4wgL7vPfv+Ijwn1mqNIlIW2ZkswtCIlXI5AMAJVv4MYb1kh+dpJ
 Sgmi99oAxIhL/WmpjaTsN6N7sy04MV9NXb5FWPygBNj7qz5y5jLQmX1fyr5HFF3alXsR
 7HyWgInOdiGJeZaBXYFkWy0qcj4JeTHAQXb7WeJY30vBnTy5E1gJ8TDyvVZJZXojnpV6
 Vong==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=ySM3sy1aI/8htuK6R6KLVEKvwLzW4CHXfLlasZ79954=;
 b=a5aWoOeTRGUxRG+JVx8UlsCzqDkCZc7vZFolYu/yhGyeS1WGATs0VcTp7H7dEISpNN
 e3PYj3MESo0dNTwow9N9TscyqvkPjNrBfwoC1PwXLoa6ISBgFkAx0STxa7P1SeYdqAdy
 8Ny1SssoIjIlxd8OSigaV1OJg15SDSdtm4wpU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=ySM3sy1aI/8htuK6R6KLVEKvwLzW4CHXfLlasZ79954=;
 b=ROLfS3sB2qtQnkylNvgv/by0Fuzban1rVfIDIe3GzMHBzn37CmyxOggJzqwFZZQVBz
 EtfIjGt+jHWN77sj13MH6gVTUav2sYy9U8EMn3PKiDMuVNzBgv9KdIFMQ2UDZ8lwCWG8
 Ld02TauLomn1LeOXE7UYeBlA6OoIdpviBTApnnJK9ouBW2kp3HItdmAkVl5HtUVzcPP3
 38rx+mJ8kOz8dwImpYe81UbPRJjefFW9ZbZgFVhrqS+O7OJ5NcqDKLfECy8UAZOTnSFi
 REDNJbr22Be+Bv9WvA6hx6748LdA0HF1io760C3wd9kcK1nrURsLH0tiW7EFhHkc1nAR
 VlCg==
X-Gm-Message-State: APt69E1aV+mZrl8PFtGxoYKJRNy6MQZfaonQWcDWQemRqfsV7HErgEEh
 f+pRlfo3LSx7KJnVLiXmecf3Om2bz+cmRUJ46/k=
X-Google-Smtp-Source: AAOMgpdddze5k2MCIvKUBhYBVYE2DnvBUrl/n/ztaVsWElhRORbWjO5DEh4UknRCQwF7FLGPDIZ4+HRQpaJlSOcTGWI=
X-Received: by 2002:a0c:8283:: with SMTP id i3-v6mr7836142qva.21.1530159123444; 
 Wed, 27 Jun 2018 21:12:03 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 2002:ac8:169d:0:0:0:0:0 with HTTP; Wed, 27 Jun 2018 21:11:42
 -0700 (PDT)
In-Reply-To: <20180626232605.13420-8-benh@kernel.crashing.org>
References: <20180626232605.13420-1-benh@kernel.crashing.org>
 <20180626232605.13420-8-benh@kernel.crashing.org>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 28 Jun 2018 13:41:42 +0930
X-Google-Sender-Auth: QDqTOnHlUwfzoNmMcIAzaLS6ROo
Message-ID: <CACPK8XepxUALx5Wsiyvyk00N98Ew=UcwRe174DZojgD46mkypg@mail.gmail.com>
Subject: Re: [PATCH 07/14] fsi: master-gpio: Remove unused definitions
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: linux-aspeed@lists.ozlabs.org, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 devicetree <devicetree@vger.kernel.org>, Andrew Jeffery <andrew@aj.id.au>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
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
X-List-Received-Date: Thu, 28 Jun 2018 04:12:06 -0000

On 27 June 2018 at 08:55, Benjamin Herrenschmidt
<benh@kernel.crashing.org> wrote:
> Signed-off-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>

Reviewed-by: Joel Stanley <joel@jms.id.au>
