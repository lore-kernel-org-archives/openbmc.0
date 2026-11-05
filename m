Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76705606A328
	for <openbmc@archiver.kernel.org>; Thu,  5 Nov 2026 23:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BCm4NjP2
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4jLJhz6cQyz2xNC;
	Fri, 06 Nov 2026 10:40:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1793922051;
	cv=none; b=iGMc8eb2Dh8iUWxvRRPZnf/oRbqKSWY4OaIWTbK6TLE1hvL63snbgdXp3XmPi0Ic0a3Kf80ECk/eBXN9OID7BEm1oEDFIz38bhQqmLFCVbqGdTUWiQeAb9FPU114gNwMnjcfmJ40aR4y3vQva7c6lrePVBhIyDZTCMvfE+CssKLte7HtmRdZ0NfJQNyjMzalAyv3cEa/9Uhi97tpC6ebi2E5J+a5mlUJ6tLp0BGe5upODfGNeb9tscRov5S3EiqUvlavueNa0+tF7VoAeouaLI4p+RnNkxlyLqPP1iWYakQ+hect+TNCNmGYEU44ye2Ry76FXB7TjMfW+na1CQEo7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1793922051; c=relaxed/relaxed;
	bh=DALcyRp0vjX3To2DbsLGpJo7XYxiod9b2pPkFTmQfLk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Tx8uTteag0BdduoOmg5XqW37kXIDojYIsuGUvkX1NvaoXwQv3lA/hXcTJXP8Q/F0dvvkEKjKxz80epkUnRSwJ8FTWtkPTCqWe5Jctk+K3QpG3cB0A23yuOnRjWem9LaVXeMFTGfoLFqXtYLYAZ8UkBGNmxPf9dYaNh+aIOPEVzab8JlhDRJXgpMsWMK4wDpi4x0ruy0OCcYHkeOZeFIEf4eyoXIJR4xvvBFLX36T3iT4ur4NeunJrjRwPHP1k7ppftfIZvco8v8X/h6BR8nkaO+DjDp2XtpYEqjJ2TVYfJe9Uo1rpmEQ292txNWcbfXY6I/T1iNuo1knP7m6uFUQsw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BCm4NjP2; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=kuba@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BCm4NjP2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=kuba@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4jLJhy6npnz2x9c
	for <openbmc@lists.ozlabs.org>; Fri, 06 Nov 2026 10:40:50 +1100 (AEDT)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6D15641FCD;
	Thu,  5 Nov 2026 23:40:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF4A31F0089F;
	Thu,  5 Nov 2026 23:40:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793922048;
	bh=DALcyRp0vjX3To2DbsLGpJo7XYxiod9b2pPkFTmQfLk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=BCm4NjP2zzmaYQx55nDTiQotiZ0+FHR5odVzEn4z99P23s+3u9VzGxonfB4eoH0XA
	 JaF3F08tmQfJK6/YdAkOMkyWnj2v9T5KPud/rUx4E4TG9kMBZE0+A4qYHoIWlzRYsk
	 pYlg00lhrz+D1WXDg+jAanxy3Bodf/rKe8UdAxXevAQVYPDZxNp3TOJzDg2juGV6bS
	 4mwTbwhPXtKAD5OzKhGNKUyM3JW0MM7tIUe7Nkwtzc2BYR+l0piz5q7AspMbKeeKtt
	 XL/i/rnwksQ0EPyJsg4T4nvNjulAUFF3dozdsT33aKtsin6UzrBLNJn09dmFJQmZz1
	 BniPbdkSVVZzw==
Date: Thu, 5 Nov 2026 15:40:47 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Akhila Kavi <akavi@axiado.com>
Cc: Sammai Chakravarthy <schakravarthy@axiado.com>, Prasad Bolisetty
 <pbolisetty@axiado.com>, Andrew Lunn <andrew+netdev@lunn.ch>, "David S.
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo
 Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Tzu-Hao
 Wei <twei@axiado.com>, Karthikeyan Mitran <kmitran@axiado.com>, Jeremy Kerr
 <jk@codeconstruct.com.au>, Matt Johnston <matt@codeconstruct.com.au>,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 openbmc@lists.ozlabs.org
Subject: Re: [PATCH net-next 0/2] net: mctp: Add MCTP transport for the
 Axiado AX3005 IRoT
Message-ID: <20261105154047.079c5eae@kernel.org>
In-Reply-To: <20261101-mctp-transport-irot-ax3005-v1-0-36ceb822f01e@axiado.com>
References: <20261101-mctp-transport-irot-ax3005-v1-0-36ceb822f01e@axiado.com>
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
Precedence: list
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sun, 01 Nov 2026 06:00:56 -0800 Akhila Kavi wrote:
> The Axiado AX3005 SoC has an integrated root-of-trust (IRoT)
> co-processor next to the application processor. Security protocols such
> as SPDM and PLDM run between the two over MCTP. This series adds a
> transport for that link, so the host side uses ordinary AF_MCTP
> sockets.
> 
> The link is built from two channels of the AX3005 mailbox controller,
> which is already supported (drivers/mailbox/axiado-mailbox.c, in the
> base of this series), and a no-map reserved-memory carve-out. The
> mailbox carries small doorbell and ACK messages. The packets
> themselves go through two windows in the carve-out, one per direction,
> which the IRoT firmware allocates and reports at probe time. Each
> direction has one packet in flight, and every packet is acknowledged
> with a counter.
> 
> Patch 1 adds the devicetree binding and a MAINTAINERS entry.
> Patch 2 adds the driver.

net-next was still closed when you posted this. It only opened after:

https://lore.kernel.org/all/66b35989-9195-4e96-99bb-df383a52aa5d@redhat.com/

