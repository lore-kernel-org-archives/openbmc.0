Return-Path: <sjg@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4003:c06::22b; helo=mail-oi0-x22b.google.com;
 envelope-from=sjg@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="rTtAcOFL"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.b="T1EGOaxc";
 dkim-atps=neutral
Received: from mail-oi0-x22b.google.com (mail-oi0-x22b.google.com
 [IPv6:2607:f8b0:4003:c06::22b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41FC2j6tVBzF0wq
 for <openbmc@lists.ozlabs.org>; Tue, 26 Jun 2018 13:58:46 +1000 (AEST)
Received: by mail-oi0-x22b.google.com with SMTP id 188-v6so14625491oid.12
 for <openbmc@lists.ozlabs.org>; Mon, 25 Jun 2018 20:58:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=FHecOEhtSNWpf8KCZP/iuMv5yMTqNtHnNrGByc6c1Cw=;
 b=rTtAcOFLVyXEZISlc9Rw8drSZBaJTrTvRzxRkJ8PwL/Jp6CjLePGvw0VA9MtC7jDCf
 FYn2Mkxuz869TdW8GGDYX4Ow+QXJ7NhAXLZeGgQC8DGKrGv+8uuYZYAw6yeF2aPpE90g
 zvE4bFFcTqJWFaqiEevpqeVNfvwpHaWpG4FVe9kNzH3bylZfy4+jX8LvgE0lxrAFDFCa
 B99t6v83zARY1xov48fQGr1RppLI05D/Qu6xfOYnVW4yN8m66SjAK6k9Nwth7Ph6Fhi+
 6dFOBqcU95D9ok1Ed1DfmvDaFn5CymmGdZ/T+o0443BlG5YckVmNo/uCCdFhTW36sNmM
 NFaQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=FHecOEhtSNWpf8KCZP/iuMv5yMTqNtHnNrGByc6c1Cw=;
 b=T1EGOaxcQbOoSwwuVg9iHR9O0fk/ahVaSc6YHgx2SnJGOTJmxI2gYJA5Bqps5LrnwK
 8jafqL8Zy6fGrKbmpWyjnZCGzHc6/HAX04XTKbNcxvm3GhR/myEZ/YrnNCUzQnUNl1H9
 Gi3/0QoHo2MOZXYj05tNmrx3M+xDupk7g0WhA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=FHecOEhtSNWpf8KCZP/iuMv5yMTqNtHnNrGByc6c1Cw=;
 b=Z7ojftLx6f85XQoJqauc4V33Wr2o2hN/txXTbfR1Sqx+4DNBPPvJl5mK34ycIXwuCV
 CQ2BiXFiHAhwICnjn3MPa6abBquai1tPKyQlKhgtEKyngaF5ez0pnJrdt62uAxdpj9Pz
 KXsu3OqKJiIoyzTnCewb5gIt4kxzpuZ2uPnhB1VxuJe+VV5JMpsvBKKBnZQmPcZKmdR7
 5FxVKy8KwhDsZNjfX1PvhwmcQVVLC1CXGlWgkrexy81MlcxcKI72iDGUdjC8IrNb7IFk
 NlY2tLDkpVIpFnG09uPaGiCsbIGQW2/ive3UhdD54YBlFaquE0BoKgyIuEzPA5Phl5fF
 BoSQ==
X-Gm-Message-State: APt69E1iQok0rISlGXSF+yN5sbEhCXkya8aUzt0FINFd9NX3+4LPFyiF
 3AkxhA/kXtxsQJKVN8fW+uxKo6ZhzGQWqMGRY+VNQQ==
X-Google-Smtp-Source: ADUXVKIqcDN6wMDE8NY77Bh0VDGQHNhUtry/n/QaYgSkQun3Rchjmb0Gl82xKJWbTXDW0zq6JI5MOyPS0AbyTVWJna0=
X-Received: by 2002:aca:8d3:: with SMTP id
 202-v6mr8909826oii.249.1529985523593; 
 Mon, 25 Jun 2018 20:58:43 -0700 (PDT)
MIME-Version: 1.0
Sender: sjg@google.com
Received: by 2002:ac9:1121:0:0:0:0:0 with HTTP; Mon, 25 Jun 2018 20:58:23
 -0700 (PDT)
In-Reply-To: <CAE33tLFRCpk70ZYpGxtuf0wwNhRf0+UR-WmJNP-+rRgUpR_D4Q@mail.gmail.com>
References: <CAE33tLG3Fju=pvA6na5z=4dFhjX+LzutcbY8=g=psik68FYWLg@mail.gmail.com>
 <ea56be8f-5010-ea78-12e5-3480d740e7bc@molgen.mpg.de>
 <CAE33tLFRCpk70ZYpGxtuf0wwNhRf0+UR-WmJNP-+rRgUpR_D4Q@mail.gmail.com>
From: Simon Glass <sjg@chromium.org>
Date: Mon, 25 Jun 2018 21:58:23 -0600
X-Google-Sender-Auth: YIqU0aQXYa4KPHMTMzrc6JaY87k
Message-ID: <CAPnjgZ2-ik71knorYbiOHr=sDTP6QMXWx6mukXZ29ackV8+Okw@mail.gmail.com>
Subject: Re: Unknown command gpio in u-boot
To: AKASH G J <akashgj91@gmail.com>
Cc: Paul Menzel <pmenzel@molgen.mpg.de>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Tue, 26 Jun 2018 03:58:54 -0000

Hi,

On 25 June 2018 at 03:58, AKASH G J <akashgj91@gmail.com> wrote:
> The BMC I used is Aspeed ast-2500 and GPIO I want to control is GPIOB0.
>
> On Mon, Jun 25, 2018 at 3:14 PM, Paul Menzel <pmenzel@molgen.mpg.de> wrote:
>>
>> Dear Akash,
>>
>>
>> On 06/25/18 11:42, AKASH G J wrote:
>>
>> > I tried to reset one GPIO using 'gpio' command in u-boot 2016.07. But it
>> > is
>> > showing error "unknown command gpio". Please someone help, how to
>> > control
>> > GPIO through u-boot.
>>
>> Please tell us the board and the GPIO you tried to set with the exact
>> command.

# CONFIG_CMD_GPIO is not set

This board does not appear to support GPIOs.

Regards,
Simon
