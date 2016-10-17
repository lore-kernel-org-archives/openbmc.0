Return-Path: <joel.stan@gmail.com>
Received: from mail-vk0-x244.google.com (mail-vk0-x244.google.com
 [IPv6:2607:f8b0:400c:c05::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sy5h44P0rzDvK7
 for <openbmc@lists.ozlabs.org>; Mon, 17 Oct 2016 16:03:32 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=z80PrPq2; 
 dkim-atps=neutral
Received: by mail-vk0-x244.google.com with SMTP id b186so7320977vkb.3
 for <openbmc@lists.ozlabs.org>; Sun, 16 Oct 2016 22:03:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=IjIFjBtVxiX92QrG7psBA+RIvRFHmcVbdAXl01DFWCQ=;
 b=z80PrPq2qzuQCzlLAheP6CmYizcneREwcO2uHHzf5F6XywuLPEz3oWAg30XEU2pFTL
 qQMz4dP7NlJxrWsfcnjHLSKjP8kK2jbdov6r0esiiUfpvvHbPzpWR1u/nailYL5iXkP3
 Ae9MDNn0eSrH/1wd2Kir5t+PfjSHUZVRLFntHOO9EbpXVLkd2J1XFn0XWR7g05J9Pq3r
 3PraKEgHwBZNx0/PtrEPTeBzTW0ell6Z/FeZgsbwALWW76bO8hKUW5ldznsJico7hUQ0
 jc0zBLP2/teTDsZbYkuH9e81ysguUMLD239mhLAyXwqvALKeFXVx4CXz0NiHysLGErtE
 AYZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc:content-transfer-encoding;
 bh=IjIFjBtVxiX92QrG7psBA+RIvRFHmcVbdAXl01DFWCQ=;
 b=Xx6VQ0WODvrJ6OXk2K8CqyUpw31JzoaiiOVWaGm7K9zOG4nwOSkYzyGwKq1tPXrzRU
 +8jQGdjNs6k5u6+XQeRtRingXf/pjYJoUmwm7Xt3t9EWQxMzL88o6EtEBdIbvIo4JqHm
 agImhVUEPEGVhED6PMKxIrDhFslg68HZuqXKxXGOaVJVf5K1dz4oHIc0yHs/nq8ACKCN
 7Ey3q1ZiODuaGU1+mr2DHi6jsHH3pZZ5JdyCVwntTYSCjP3QMbh4MENNUdZ+nmg8JHvb
 ig/BY/V+jR0t/2dhdFuzdiG0639vyMfdHWHndIsdUk39AIDDnar2qXGba/fSzCMJOpLy
 KVIg==
X-Gm-Message-State: AA6/9RlcIIEYn2bRNMGDUogVqmQ9Ekbn+UauofbDpJpvGwSrDCLhNdKVbkE8keejMvdsS0meDjBngaiM/fAr/A==
X-Received: by 10.31.4.207 with SMTP id 198mr15952779vke.82.1476680610342;
 Sun, 16 Oct 2016 22:03:30 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.176.7.8 with HTTP; Sun, 16 Oct 2016 22:03:09 -0700 (PDT)
In-Reply-To: <1476448684-6149-7-git-send-email-clg@kaod.org>
References: <1476448684-6149-1-git-send-email-clg@kaod.org>
 <1476448684-6149-7-git-send-email-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 17 Oct 2016 15:33:09 +1030
X-Google-Sender-Auth: 2gm0_0R2diS1FzNfbEiDzpfDW5Q
Message-ID: <CACPK8XfPiyODEYOfrtg0ASQqOS4F+8H_AMbUABZJiemON2G2Mg@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.7 06/12] ARM: dts: aspeed-g5: update ast2500
 evb with new spi-nor binding
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Milton Miller <miltonm@us.ibm.com>
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
X-List-Received-Date: Mon, 17 Oct 2016 05:03:33 -0000

On Fri, Oct 14, 2016 at 11:07 PM, C=C3=A9dric Le Goater <clg@kaod.org> wrot=
e:
> The ast2500 evb has one flash module for the BMC firmware and one for
> the host.
>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Reviewed-by: Joel Stanley <joel@jms.id.au>

> ---
>  arch/arm/boot/dts/aspeed-ast2500-evb.dts | 28 ++++++++++++++++----------=
--
>  1 file changed, 16 insertions(+), 12 deletions(-)
