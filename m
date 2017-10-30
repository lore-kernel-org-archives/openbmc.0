Return-Path: <venture@google.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:400c:c05::22a; helo=mail-vk0-x22a.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="Xh11TiK7"; 
 dkim-atps=neutral
Received: from mail-vk0-x22a.google.com (mail-vk0-x22a.google.com
 [IPv6:2607:f8b0:400c:c05::22a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yQhjY36h9zDqmt
 for <openbmc@lists.ozlabs.org>; Tue, 31 Oct 2017 04:46:08 +1100 (AEDT)
Received: by mail-vk0-x22a.google.com with SMTP id g69so8646014vke.5
 for <openbmc@lists.ozlabs.org>; Mon, 30 Oct 2017 10:46:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=gKe7uDkHlZLDX9bBUcuQetBOGzcJ5TCg4VPD+9xF5hw=;
 b=Xh11TiK7gQ2P6qxU1Ce9IjTbWAzYTwv8KpiVyPvrJ38Bts2ABLTRwZ2XegT0ROALVa
 xrKlYulTjfn8l2JcheKMTfSNpHaD8g3ZXYxawp2QZfUB2IMSivb5kweaKcNZmyJAEDUO
 ItlIKgBu66x/6XEKHck+bPYyn2Im/Ugww+nKckbjoBttYUWtmFFLYWTH2MsvUqTTaUcl
 zoeJMr17bQfmgb9faLpjkpBoHO9rQ0o2cdu5u7vKo0thWfEdte+WRtVsf5eKohQ9Lwh0
 GvtgGgpqneVOa8rjX+84ByJggYFKvgSdeawSf7oLsMeGjbWqai/s+g86Z5uVZktATFBL
 ce/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=gKe7uDkHlZLDX9bBUcuQetBOGzcJ5TCg4VPD+9xF5hw=;
 b=YdU/DeUjHUSxs5cffXDNnKhHV8j12XyHtFBR5Xhw/fmzFpZDFUzooi3tkWWY+6sMSE
 kbglLLcqRx2emLc8e5fsfjUCLgmipUm8ZjkIogKF08zSCL3skvt8noh7EYy5WiTHWZr7
 o5HNn2p58jlAHSoe5T5ZfSavomsghQ0gHpO75yfKTcsC8GFQU6uboQPWHFtsDXzNIIAg
 6E5SSpZJvsoQs0d3iDKeB2bC4Nhb4OhIkKImx8AghmSFfknwFuvyQ1BMInT/6+S6hf4w
 rQguMG+q5xitJWGKJRbKLF4s+kLUBQfF07ZiuSCjTji75jZ09QYpRFFVqI2tTqNaACCr
 2oaw==
X-Gm-Message-State: AMCzsaX6ucR+eqAWfy5h2ChLyYQSRg19OLOjcfy6kKTNxCFOrIBbs6SY
 hSmOHMpU36at+MOtF9U/P030a5J1Fx8IVziCo5ovg3xE
X-Google-Smtp-Source: ABhQp+QPC1VdzXev/YYbh5FFjNqvs0mcwsWxlAiHfqzTI2/cVf3aCvCD0pJzXYXrtYGjL9mVCtu+ZhmbQgvxKJPzq48=
X-Received: by 10.31.167.151 with SMTP id q145mr7208161vke.49.1509385565911;
 Mon, 30 Oct 2017 10:46:05 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.163.73 with HTTP; Mon, 30 Oct 2017 10:45:44 -0700 (PDT)
In-Reply-To: <001801d34c20$e670c150$b35243f0$@linux.intel.com>
References: <001801d34c20$e670c150$b35243f0$@linux.intel.com>
From: Patrick Venture <venture@google.com>
Date: Mon, 30 Oct 2017 10:45:44 -0700
Message-ID: <CAO=notwfaf_njAgTY7YXtes_PwZc4RW8yMy3nVSBPw2Q0+BP7g@mail.gmail.com>
Subject: Re: PECI API?
To: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, ed.tanous@linux.intel.com, 
 james.feist@linux.intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 30 Oct 2017 17:46:10 -0000

Thanks!!! I'm very excited.

On Mon, Oct 23, 2017 at 10:03 AM, Jae Hyun Yoo
<jae.hyun.yoo@linux.intel.com> wrote:
> Hi Dave,
>
>
>
> I=E2=80=99m currently working on PECI kernel driver and hwmon driver impl=
ementation.
> The kernel driver would provide these PECI commands as ioctls:
>
>
>
> - low-level PECI xfer command
>
> - Ping()
>
> - GetDIB()
>
> - GetTemp()
>
> - RdPkgConfig()
>
> - WrPkgConfig()
>
> - RdIAMSR()
>
> - RdPCIConfigLocal()
>
> - WrPCIConfigLocal()
>
> - RdPCIConfig()
>
>
>
> Also, through the hwmon driver, these temperature monitoring features wou=
ld
> be provided:
>
>
>
> - Core temperature
>
> - DTS thermal margin (hysteresis)
>
> - DDR DIMM temperature
>
> - etc.
>
>
>
> Patches will come in to upstream when it is ready.
>
>
>
> Cheers,
>
> Jae
