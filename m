Return-Path: <venture@google.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:400c:c08::22e; helo=mail-ua0-x22e.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="E7teCy7I"; 
 dkim-atps=neutral
Received: from mail-ua0-x22e.google.com (mail-ua0-x22e.google.com
 [IPv6:2607:f8b0:400c:c08::22e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3ym7RZ1Jh8zDrPk
 for <openbmc@lists.ozlabs.org>; Tue, 28 Nov 2017 13:49:29 +1100 (AEDT)
Received: by mail-ua0-x22e.google.com with SMTP id 31so15360295uaj.6
 for <openbmc@lists.ozlabs.org>; Mon, 27 Nov 2017 18:49:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=xpMh9sSSB0xYCnrYCrullnKrYyeGtAqF5x8+UQMB3b8=;
 b=E7teCy7IctsI79mlH+qncxd0HIeuaifgOKZyIjVpg51tAykKD43BpG1WQQPoE8xAwv
 9VhTUc3IZ/h/9PKO/21HtaEKcxqn3xFhre3sLtpyLl7YzdhVTHd/w5P/BnqPReG9Jrqs
 Pr/ZbzFJxKrTzmuuG7mFd/ppnuh+ZOYrdIo/RjQ1llYecwsFYIF4L2a+0mjnnzP4y+Yv
 Y+zCNozsFfY9MtPUEnwNTr+EPvx2Vb/b72j9BrT23oUvGBQcG6kcV3gS4SbanJx8KzTu
 DtBI0HE49GTt74I2SGtFjSDYHA1uFpdl526YWmQb+RUJD81AosO62Iv9PA79SVu4qrCl
 jyPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=xpMh9sSSB0xYCnrYCrullnKrYyeGtAqF5x8+UQMB3b8=;
 b=WPHLbZQdZw1xVuDGc+k0B57GPuf9gXX+/9r6AJ6xkb8mcA/vK68BUJh+WAmEexLrvC
 Y9GWPPQxMEZU7poNW67J2KG9GHlYdLsqWOF3CknIX3LStgXaNDjL3Gb5+0IFKSfCVX0x
 Z3LTi23z5UeOeNEeZBTBN1TQU0ciNpg3PdJlYX5FW8Cu27/sWHx6FUk2TfuCV+X9efqa
 /dhKkgWVA6M+9LbdlRyOc5Xl4xGxiJcYysLflKFi2JJTnZDbSc/hxbyHcCdApCWVx1/l
 VMf1KHVEmEWLnG4uv0sAGxM2As/VG8q8XCG1nR3rQNoCJ582o5Nj0RYEUDc96PDs6sNA
 In6A==
X-Gm-Message-State: AJaThX5tfHG3BxZB0RZmQzuEWYaIGqubMa0M+ZKQEc1VaNyRsoJmQYgN
 1widDq6XMnwpuiPC8nb8vHlEm37EJ3GUGYU441GQHQ==
X-Google-Smtp-Source: AGs4zMYy0O3Ycyr85FvD2g2vn3wv2PjYwde/xC11aPgkp0fVzL9hTYMIwbKPoAIuWFi1c+JhE0N4nWXRZrmIPLzfstg=
X-Received: by 10.159.50.2 with SMTP id x2mr31919700uad.38.1511837366452; Mon,
 27 Nov 2017 18:49:26 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.94.150 with HTTP; Mon, 27 Nov 2017 18:49:05 -0800 (PST)
In-Reply-To: <CACPK8Xcv8F4WHs8bynxDSLK6pg4hYTm2w-044RmJ6dOEcYevJA@mail.gmail.com>
References: <CAO=notyW=x_9j45SDd-75WULwXQdTHhUx65R7YUUSgaBp2+qgQ@mail.gmail.com>
 <CACPK8Xcv8F4WHs8bynxDSLK6pg4hYTm2w-044RmJ6dOEcYevJA@mail.gmail.com>
From: Patrick Venture <venture@google.com>
Date: Mon, 27 Nov 2017 18:49:05 -0800
Message-ID: <CAO=notxMHYoZgxBJQpXOoP=TxcZFXJaNjFw=uFnw=4R9zyxSzQ@mail.gmail.com>
Subject: Re: Linux 4-10 v 4.13 patching
To: Joel Stanley <joel@jms.id.au>
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
X-List-Received-Date: Tue, 28 Nov 2017 02:49:30 -0000

Thanks.  When sending to both, do I need to send a patch for each,
dev-4.10, dev-4.13 in the header or is it better to not specify the
branch in this case?

On Mon, Nov 27, 2017 at 6:39 PM, Joel Stanley <joel@jms.id.au> wrote:
> On Tue, Nov 28, 2017 at 1:52 AM, Patrick Venture <venture@google.com> wrote:
>> I'm sorry as I probably missed the email, should I send patches
>> against linux 4.10 or 4.13 or both?
>
> Good question. If you want something to boot this week, send them to both.
>
> If you're just wanting to get them in the tree, then just send them to 4.13.
>
> I am working on 4.13 but it's not ready to go yet.
>
> Cheers,
>
> Joel
