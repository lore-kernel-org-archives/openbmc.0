Return-Path: <joel.stan@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400d:c09::242; helo=mail-qk0-x242.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="f2dZBVSY"; 
 dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="BVbhJhiO"; 
 dkim-atps=neutral
Received: from mail-qk0-x242.google.com (mail-qk0-x242.google.com
 [IPv6:2607:f8b0:400d:c09::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41GRD915myzF1M8;
 Thu, 28 Jun 2018 14:11:21 +1000 (AEST)
Received: by mail-qk0-x242.google.com with SMTP id d22-v6so2283118qkc.8;
 Wed, 27 Jun 2018 21:11:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=tXLK+AQqu9YDRNRM9/OkJhrWZg7IHhl7rrGI6GHf418=;
 b=f2dZBVSYLzz73LfigAb54kprsEaKLJ8e/oXIeJMB0S/0wVDm8xSzexsnHhc0eC5F2H
 00cqbQaqbPIc4yKAMPb7SHcsODp35E2zVUsIugprixPJ7wefhCPjQvnMRKMVpB3RZ/gl
 axcTGBTRmf4df5UP0CuJe0ROu7wRDuYYoOWiV5QMh6lMygWh2y5+KoJVL316pQ+4iyJv
 59yLa9EMlHL+pQmyVvtmpNcBoohlA0/k3vm7GdHxYRoofpuDGMi0KPeN1gr4UjcdgMo3
 gGk/cuBqE9N0JF0AsA7OvMt179ajObGcncVBAbA3gj9Z7JKeII0M6PQDMxeytNbH8dCS
 Kphg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=tXLK+AQqu9YDRNRM9/OkJhrWZg7IHhl7rrGI6GHf418=;
 b=BVbhJhiOHoTGrWksXaP2pTA3ScHtoxIzAC0JyW/slwwrsabsFHy7PqYfuMM8x86DCy
 yeZhcteaigo4pmsl6JiQdlTcVzPaKpYxvzUss08sHySBvWES5SbD4H0CqUQUya4i7/mH
 l4hkjjhWkv5Az14hnSax4vhJsZFSF1o2A44ZA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=tXLK+AQqu9YDRNRM9/OkJhrWZg7IHhl7rrGI6GHf418=;
 b=b1UMCJQN2yqJaKdwKJ2AxWbQlh3OMyOYQo7Ac3MPkNwKcrKON5RHowI8flJCEOZHZE
 hBD4JzJqYenpVwfBf8zNQpx0mAtO/xg1ouBXWlU6gn8Bmj2/iDtyZ1iv1yq5GKzm4a+n
 U/J10l90n/BL089qRB58fyHMGcwXXNn5uUzzN8MU6y2avgzNVNRzHfFO5JwWPvr59FY6
 2X6OGALP00snltYMM/+Nr5Y2XT0BQ7zjrLIZwQg69+cHW2mOarIbfNFlXtR13LI0RX2m
 VsdrQTqKgM/x6J+Dl04+ru8wsM5qswLQKsYgve7twXxSWORJZ07P/jOFYAReGDZ1QOUx
 ea7g==
X-Gm-Message-State: APt69E0nHMuibN2XPY3QFzPHQABzbY5fegjdsVbOBkufzwOyFl75/2fY
 Jw40nDE/5DNpyH8BHOcHPUeUZqxpEAOjoiP2oPI=
X-Google-Smtp-Source: AAOMgpeE5n9gS9ANjD/2HQtmP8Aql0qJXuf7Zg+obgvZoFIfyrJwUhDmgoOoJ8VmHmQHgz8x2peffpa8uJuQD9CZ5yE=
X-Received: by 2002:a37:6a04:: with SMTP id
 f4-v6mr7342365qkc.112.1530159078916; 
 Wed, 27 Jun 2018 21:11:18 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 2002:ac8:169d:0:0:0:0:0 with HTTP; Wed, 27 Jun 2018 21:10:58
 -0700 (PDT)
In-Reply-To: <20180626232321.12372-5-benh@kernel.crashing.org>
References: <20180626232321.12372-1-benh@kernel.crashing.org>
 <20180626232321.12372-5-benh@kernel.crashing.org>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 28 Jun 2018 13:40:58 +0930
X-Google-Sender-Auth: YCHrBQZmt6ThTx1vDR_jWBUUVhA
Message-ID: <CACPK8XfedsD-PYE-7LBrgsJn1a8J0ogN8m+neBuRC1ecXtj6Yw@mail.gmail.com>
Subject: Re: [PATCH 04/14] fsi: master-gpio: Rename and adjust send delay
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
X-List-Received-Date: Thu, 28 Jun 2018 04:11:22 -0000

On 27 June 2018 at 08:53, Benjamin Herrenschmidt
<benh@kernel.crashing.org> wrote:
> What the driver called "FSI_GPIO_PRIME_SLAVE_CLOCKS" is what
> the FSI spec calls tSendDelay and should be 16 clocks by
> default.
>
> Signed-off-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>

Reviewed-by: Joel Stanley <joel@jms.id.au>
