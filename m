Return-Path: <joel.stan@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4010:c07::243; helo=mail-lf0-x243.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="muu3vYFx"; 
 dkim-atps=neutral
Received: from mail-lf0-x243.google.com (mail-lf0-x243.google.com
 [IPv6:2a00:1450:4010:c07::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3ybS0663ZDzDqkY
 for <openbmc@lists.ozlabs.org>; Tue, 14 Nov 2017 10:44:06 +1100 (AEDT)
Received: by mail-lf0-x243.google.com with SMTP id e143so20269807lfg.12
 for <openbmc@lists.ozlabs.org>; Mon, 13 Nov 2017 15:44:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=5PSD4ixc7Qrxttk4ytDmkVYOhdb6Ez+XClrYtDDT9rs=;
 b=muu3vYFxX0zCnd7HtqwQJBGSFy87ayVKJRuGIN7wEg3nyJSYUkNcji+pBR8zM0rfVa
 Dr3EtLKCJ67EJ22j61zrlsjTQ4hcQZh9CtorXgTXW+5DWlU415wKO4JaaoXXTvvULxNb
 r0qLqQm6hR3LQV6mYKl31wxd79//yk014g700aI1x7arnMFmpwBqwrCxcb35af0vBeiZ
 wEVrdoj/IpadCM7ok1bpbzZGCZxx4OF3ODQ/hYmDJlJhF1YPFWakfRsyxZzJDpQf/6Zl
 /Acjtfho54p32KVS3nZlRynSPd8Hj3T+Bo7pNiMFUsOOtciqolBTAbCQZG9h1Xmu8vTn
 hIxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=5PSD4ixc7Qrxttk4ytDmkVYOhdb6Ez+XClrYtDDT9rs=;
 b=SjMdq9pArJy2vzfN3yEtpW34mShdxfXlvlhpx06c97egdpn6txxz728X26VSxGPC4+
 B303+XR+E2tXvbc0zKqVfZSPQW63bsvBH1xDi92nP/ioR686Bw8BQregfcfEIh/6KqYr
 N9ZmC2kHTyDR6qYnq8B5mobnHWK/2cHFdjntAJ90kF+YfpdTHKZHnwyykxr1Ny8uuFl4
 Lerpkt9RJLQvPqbI8eX0A3bfRRY+wHgWH3+lu9RmwXqjXoYeWvygXF5OhgzqMTXqTtea
 gzq0dqUG9JlL0upYYEWZs7vRW1+/Ka9VU89vDEb/EC7oab4DK7Vwl01hY1jikUaEV0bI
 +4zw==
X-Gm-Message-State: AJaThX4zfkOoJWMBql6/3rQjbEPoFjiofFHjg42KzBZYkc9P70eONWbp
 6M026hDr+W+/lrCWIZPEPyiJajldt0do60r8XRE=
X-Google-Smtp-Source: AGs4zMajif6TmNjjEXkJhKmn0CvJKfrPjF2RmVezjvClmSeB/WvorzL6vF/nrWJ5yf1sJPwbOv8Z0ijlEPT9bA1ckt8=
X-Received: by 10.46.64.82 with SMTP id n79mr4288428lja.129.1510616642433;
 Mon, 13 Nov 2017 15:44:02 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.25.155.4 with HTTP; Mon, 13 Nov 2017 15:43:41 -0800 (PST)
In-Reply-To: <74db8309-6d27-d951-53fb-c3252af9403c@linux.intel.com>
References: <d011d483-b02d-b2ad-6b70-eb278a21fc33@linux.intel.com>
 <CACPK8Xfi_OV9sjQRauH_JbYP4H8mXFYWjfG8kAF8R5WxQZ7SKg@mail.gmail.com>
 <74db8309-6d27-d951-53fb-c3252af9403c@linux.intel.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 14 Nov 2017 10:13:41 +1030
X-Google-Sender-Auth: O5npBYzRsII9LsmnpuKXRxRmOk0
Message-ID: <CACPK8XcH99Fqp-kHE--wpXtGsE9_fkgUmevWdKVX4RwDSzLvVg@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.10 1/1] arm: dts: Add Wfp BMC Machine
To: James Feist <james.feist@linux.intel.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
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
X-List-Received-Date: Mon, 13 Nov 2017 23:44:07 -0000

On Tue, Nov 14, 2017 at 4:16 AM, James Feist
<james.feist@linux.intel.com> wrote:
> On 11/12/2017 11:36 PM, Joel Stanley wrote:
>>
>> This is the same as aspeed-bmc-opp-flash-layout.dtsi. Is there any
>> reason we can't reuse that file?
>>
>
> We could, however it seems a bit awkward to have this platform lumped in
> with open power, as it is not an open power platform. Also if we decide to
> modify the flash layout then this would have to be done anyways. I am fine
> either way, it just seemed to make more sense having them separate. Another
> alternative would be to rename aspeed-bmc-opp-flash-layout.dtsi to something
> more openbmc related instead of openpower.

I'd be happy to accept a patch that renames it. I was never a fan of
the opp string in the device tree files; it's namespacing that
upstream dts and dtsi tend not to have.

Cheers,

Joel
