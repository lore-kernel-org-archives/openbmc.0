Return-Path: <mine260309@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::d31; helo=mail-io1-xd31.google.com;
 envelope-from=mine260309@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="TyFaFWjt"; 
 dkim-atps=neutral
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com
 [IPv6:2607:f8b0:4864:20::d31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43lcHQ1pDnzDqCq
 for <openbmc@lists.ozlabs.org>; Thu, 24 Jan 2019 20:26:57 +1100 (AEDT)
Received: by mail-io1-xd31.google.com with SMTP id t24so4165762ioi.0
 for <openbmc@lists.ozlabs.org>; Thu, 24 Jan 2019 01:26:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3TjIf8oqlUBWIjNMCz8xHtSQ2i+6+PGV+3znS7T/+x0=;
 b=TyFaFWjtcXJJgu9BpMHPDi81J5aFjDVnSGD2Az6T0jA9ySuSCculGUJ9qFwS/iVS1j
 uN5Tlq++CeR1eD4CCMurPyW0ALjVed7YN5sFruGlDRxrtnlLhw6W4UeQPmccxHOCF11j
 XY5UVrfDPxBJ2YSZUh2AU4PReglgnVPvSblAr/+No85yVEmQ/VozdOw73HoEHMtgdY0B
 8IyhgR7IVjmQhb1Dbzvj8T0jHAHsrdMuopSEbwVlGJRySigzqmfvHfdh93gw0br8oaQq
 Gw1kGBOOuZSqHzwGy16/0oKAua0qhvePflTW98XnHB3yC6CHrfKbf708xht+2cFeeLuI
 HtHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3TjIf8oqlUBWIjNMCz8xHtSQ2i+6+PGV+3znS7T/+x0=;
 b=bkT3gxykHWSPNynokAr1rT1GPbg1Ncj0cqwewJo5ZtLykjS6H/VDU4Ts2E3mnMpTAg
 RWqQBi1EbDWANPEJWuMsnhSRhqP4ebMzzihlVQvE6E0SJSfDVhTtEiN4k6kpxbH7PBYs
 hkGS7zvml/D8Jr6z8Hry2uOl/+wikzh9bAeIqPWalqwhUD6LPT1wHKhecLr86YxzwmCa
 Rv1fk116d5uBKR+9K5Jv28SWU9RXQZq0JluTfsnWVHokxPdn2iJFT3xP17dtXXIow6z5
 OwQKkpb71Men6U2xmQDrDOu6JJAglodbOmBBLOGzy2t0lVM6eXfyJS6pvaIlwC5GfcxK
 tQrg==
X-Gm-Message-State: AHQUAuZNNQSrSW5RyqCp2UxWi9XnN+CeyaF/+ZsOfOx78EjBTXH8CzKY
 Ifc6onmsMSmL6TUOgIPgN5EFEZ0TAYeyn6V5I14=
X-Google-Smtp-Source: ALg8bN6vBowqMmNW7pMZPlzLmKLz0n/C8+nikqyhTPlFVBubjpnwQrXQzzrEXmLXSvcgpy6iQln0q2qIHtDXYAnsG9Q=
X-Received: by 2002:a6b:4106:: with SMTP id n6mr3346187ioa.171.1548322015629; 
 Thu, 24 Jan 2019 01:26:55 -0800 (PST)
MIME-Version: 1.0
References: <6065976.siBLTEBlHZ@flash>
In-Reply-To: <6065976.siBLTEBlHZ@flash>
From: Lei YU <mine260309@gmail.com>
Date: Thu, 24 Jan 2019 17:26:39 +0800
Message-ID: <CAARXrtkg0uoJ7L8cwme8mkckmNj5bwb1hk15iWgqVYXbJ5pOCw@mail.gmail.com>
Subject: Re: OpenBMC Sensors
To: Aaron Williams <awilliams@marvell.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Thu, 24 Jan 2019 09:26:59 -0000

On Thu, Jan 24, 2019 at 5:13 PM Aaron Williams <awilliams@marvell.com> wrote:
> I see how to set up the hwmon portion defining the devices based on the device
> tree, but I am unsure how to go about configuring the YAML and other files for
> this.

For sensors' config, please refer to
https://github.com/openbmc/docs/blob/master/sensor-architecture.md
And it looks you are looking for fan controls, then you could refer to:
https://github.com/mine260309/openbmc-intro/blob/master/Porting_Guide.md#fans

(I really need to submit my porting guide to openbmc/docs)
