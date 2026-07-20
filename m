Return-Path: <openbmc+bounces-2303-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 962E7C44515
	for <openbmc@archiver.kernel.org>; Mon, 20 Jul 2026 14:34:56 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4h3jhm6xsvz2yY0;
	Tue, 21 Jul 2026 00:34:48 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::102f"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1784558088;
	cv=none; b=cu2tZ79ikd4HWd0YCvpqENkeE+aMqzaO9j7djHaqyqmiL0covzpj0PMVzByqOM/jFdQVKPlopYMFIcltINxpWt3rW9RNrB5yYq4keGOfj4XW6LgpJqLvW22C2Fu6DDlByzebN0CknhO5uN3NOeG2MwEOpOp1b0Nsw9lOjylWq/peU3Y37O+u/26CmGJ0n+exSqh7rnfVpmIBkTVF5s6VTwrEDLFTLjaowNM44s8WAKng1XpP04AwfcjhskQhikTYodsDC/9nz2oVWVKG3sN1En10dJspfnBZRReN72RXZNojNQuX9OfSd3wwseEgSaQGU3AxLX6TXzVNymMFh+VJTg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1784558088; c=relaxed/relaxed;
	bh=cjKBPerM/kEV9sFP3TfnBk/RDM8de3WpOH8cyJh/jYg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S1kajlVBnXsaNT1rf5/pmTlRi4AkYsj9pzuJXySlR0pxi5Tm4rUJt9yJO0lWbq3W2ScgqSA/d84R+poLUHaupsOZRRkE7zY5RcuQfhu0Pth5Bx1hfJr87vYucSNyJjmfgV9lBfLmOgjvAUWgltYveHUqFttWsu1nO1X79N/RnylDJodDQOrsR30kjWXNN+BGbcYYRG53n1MkFX93ZI3v9fLPapztts2HEIUOj9Axnra5HmnYE1YKDXxa6KoC85Xw1nX2hQ71nbYuZ9qFnUv3kWHNdL7TkuCasnvzrzIQGAn1L0G7gaM2dhZOyOzvCyeERs0OlOjFyAdT4HZnwmVIFQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=DVEATsXH; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::102f; helo=mail-pj1-x102f.google.com; envelope-from=groeck7@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=DVEATsXH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102f; helo=mail-pj1-x102f.google.com; envelope-from=groeck7@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4h3jhk4dT6z2xF8
	for <openbmc@lists.ozlabs.org>; Tue, 21 Jul 2026 00:34:45 +1000 (AEST)
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-38e7109321dso891920a91.3
        for <openbmc@lists.ozlabs.org>; Mon, 20 Jul 2026 07:34:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784558083; x=1785162883; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=cjKBPerM/kEV9sFP3TfnBk/RDM8de3WpOH8cyJh/jYg=;
        b=DVEATsXHSUidz9Iz4PnNEf5mtzOb0TlBN1arSeKse8AOVzQL7Jn3nqexvrBAENQ7xT
         if/zmrlOXui2eGaK0UHW+aYqklzwuptTF/pofjYI3ya8pgW7W6GuSNLq4JZrZdhdOrXH
         MwXPfURsGh6oXTlHv6t02A4z59BwRwzBBwV7E/nwjm/gaN2LUUAQIBkktSxoftBrRu/P
         zOXhYjOAqh4+gLXBrGTqhPMLjDtkh2sPexKZcQw3OMzr0+NP10knu5HEKCJYScehYxBp
         XPp3gt07QEYbB4YCFhJMW2qOSzqC7AR7WtRVjJKVPQE/HLWDCSKUBQWsPLBqWo7hB8Ka
         B20g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784558083; x=1785162883;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cjKBPerM/kEV9sFP3TfnBk/RDM8de3WpOH8cyJh/jYg=;
        b=Ho3cJZdHr/oaarDdtIOH7vftNo6gvhS6nmBRq9Lm39QECIMkUu4yNHt4GcjLdCygdz
         OnyZfCRqKk7hKQh7LEytohPGDbJsmpMEgbkzkBh09TT0GwFFqk1ZjA3qDjcWMoIBgq4I
         S4ywaUfxDBYQVwGSNKJlHIuTaOJYgLOiX2r93m37CpL2aUBnxksUfPLsxUCX9KD5f/1n
         d5Kesyzefbgxc2FLGniIYDVK5ZtFvxJJfdaFzoDncPZ1DnNg0+Ij6OEPLpacTkuele81
         erSMaSfPRgKtCF+1e2VCGvP+ivlPUjVBOCOwy1rnUANIYbh1KW0hyv+7ml1ujtHgSpfE
         uJgw==
X-Forwarded-Encrypted: i=1; AHgh+RpodIOj0QWtYyS33GRZzGKmS0jCPrBxoclyCMuGUzhrw8cUC5jz+0QaGfGRjO3D6FvXqOgxvZ9+@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwLxVyw7lTciNSWp3kfwaGh4W7OCCYq+C+TSMRdre+noscs7mO8
	RTJzDr2hEJROeKsomcxbHMGX2kZiImoARtwHFNyxwk7NLyaHJ2+YW9Zm
X-Gm-Gg: AR+sD13Ix2NXKEhzWd6C/f2shwMSW8jSm+f/8sx3zUAv8gFLMyBABFJBCQXdvhbjXl2
	Xv9kGYX1iE8lPvAnV47ScmtbfwmtzAHKWI5fC4psw+wxprWjY7UQujUCLz7KotJcPpaNTrCOjUP
	qtJ3c2SAw2/c6c5+hbDuQGML9zkz2r6aaoP1OsBQUNOfiCMYr0kBMotZnQ0QiutayAfmEACTqB4
	3xJcM6VF5+jROg/mlaOpwH2GbBsQXcGhOaJSnEeq/GLy5pUTi89EdS5QWNrEZn5GAJIpOobsZmG
	hNs6MifUsR927t7/oZvgfGcIN88Oy7cF9iTEf3/0HkG4HfeJCK3RV0AAMbuqdVy/cTny4Yqq71M
	dO+O6QxP/w7dY5uHn3TPDd361UqhLc18MMxBmIwjD4H/CwLc6K52pD2x08OYcKS5T4mZB2ETsd9
	fTluVTsYX1linx3H0=
X-Received: by 2002:a17:90b:58a4:b0:38e:69ae:7148 with SMTP id 98e67ed59e1d1-38e69ae720cmr6039935a91.24.1784558083129;
        Mon, 20 Jul 2026 07:34:43 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13ce29e13a8sm31412488c88.4.2026.07.20.07.34.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 07:34:42 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 20 Jul 2026 07:34:41 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Pan Chuang <panchuang@vivo.com>
Cc: Andrew Jeffery <andrew@codeconstruct.com.au>,
	Avi Fishman <avifishman70@gmail.com>,
	Tomer Maimon <tmaimon77@gmail.com>,
	Tali Perry <tali.perry1@gmail.com>,
	Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>,
	Benjamin Fair <benjaminfair@google.com>,
	"moderated list:ARM/NUVOTON NPCM ARCHITECTURE" <openbmc@lists.ozlabs.org>,
	"open list:HARDWARE MONITORING" <linux-hwmon@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 4/7] hwmon: (npcm750-pwm-fan) Remove redundant
 dev_err()
Message-ID: <cb3a7e8c-736c-4658-b6d0-b8fda7846a96@roeck-us.net>
References: <20260720063745.309331-1-panchuang@vivo.com>
 <20260720063745.309331-5-panchuang@vivo.com>
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260720063745.309331-5-panchuang@vivo.com>

On Mon, Jul 20, 2026 at 02:37:38PM +0800, Pan Chuang wrote:
> Since commit 55b48e23f5c4 ("genirq/devres: Add error handling in
> devm_request_*_irq()"), devm_request_irq() automatically logs detailed
> error messages on failure. Remove the now-redundant driver-specific
> dev_err() call.
> 
> Signed-off-by: Pan Chuang <panchuang@vivo.com>

Applied.

Thanks,
Guenter

