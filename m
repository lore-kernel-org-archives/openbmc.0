Return-Path: <jassisinghbrar@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:400c:c09::232; helo=mail-wm0-x232.google.com;
 envelope-from=jassisinghbrar@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="EKDwq2Gy"; 
 dkim-atps=neutral
Received: from mail-wm0-x232.google.com (mail-wm0-x232.google.com
 [IPv6:2a00:1450:400c:c09::232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xmCK51j9bzDqXn
 for <openbmc@lists.ozlabs.org>; Tue,  5 Sep 2017 00:43:52 +1000 (AEST)
Received: by mail-wm0-x232.google.com with SMTP id v2so6243802wmf.0
 for <openbmc@lists.ozlabs.org>; Mon, 04 Sep 2017 07:43:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=JD6/THGp34bJ0kBY/eSKw9SOP9622GdFgpy17Vm9r4k=;
 b=EKDwq2GyG/6QqkGwjmZejObIGBZ4q6/geNYRaK3t18zSi3Kkm2Gb4DAbXh7QpXmhnt
 yugUtccoxMpe55bmFrqiwzyejN7cI4M0pYfu4DV/7DQ6wtaqPKN0HkMcU+0XGD7kmkg5
 K50HrZHMJviA97cIQ0MmLeYC0ia+RYK0i9T4ZVdg7Wn86zTpbcu1GOjAIFRUhXA13E6b
 RECoFEVJ1iYrveANhHoEqbQu8D5iVtBKMKuNjTDzQVCtiV8/Jz2SBIfyf0oYV7GRaxIB
 v3UMPtArIQo6M5/ugEV67RfOv8zj8X4RBVEIQQUw4TfFPF72yvTEktYS7JievySueV10
 yVlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=JD6/THGp34bJ0kBY/eSKw9SOP9622GdFgpy17Vm9r4k=;
 b=XQGhJdDwvUp2lmwLaNSxZhVa5pkdFxNR6rql5aeRMA2/Usvu8Pm9NpeP3yB2JIr7Ri
 PSUqHEKIYVRxcNb8ePQE0bogdwELYtHUWZMsETfgTEFjodbqaV8LMbRrTAflh7bu+mZs
 F1RkOVsh20/FfgFz6eOYcN4hq7U19mI+Kf1oUfyUJz0S9OPaywk0Mmn8XHUNbFtXTtci
 p4KFGM+ZBRyOGBnNXIT0CJukr7G7stbMIc0iwk4s9KO8BuYwQNZ8xbd6KdkrbztLsKij
 XlxpUapkX+n8RhCzspjlIs/VzxMoZL8WHI7JJecTaQrQlCfWxLviSBoPXGtRE9b9v2Qq
 Q5LA==
X-Gm-Message-State: AHPjjUgaEDdNlWkZXlhOus0jtcLC721VSD5ESvvtHkNw2sWiLXrEcSk5
 7oz8JfLGYw8Z1/q0TLzzXUCZaFz1f79e
X-Google-Smtp-Source: ADKCNb6FH9yax1C/X6TyLJrK0eJwZtY06+rJQG7qUKBiWuJeLp3vl+ot4RZWa416jBY0J2wa+RfDOexAurtD8UcF2Lw=
X-Received: by 10.80.177.71 with SMTP id l7mr731170edd.186.1504536229821; Mon,
 04 Sep 2017 07:43:49 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.214.21 with HTTP; Mon, 4 Sep 2017 07:43:49 -0700 (PDT)
In-Reply-To: <1504509469.4080.6.camel@gmail.com>
References: <20170207233623.18737-1-cyrilbur@gmail.com>
 <1504509469.4080.6.camel@gmail.com>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Mon, 4 Sep 2017 20:13:49 +0530
Message-ID: <CABb+yY3K4AbqqHZuKqquOrN-gCQeRTvh2Ahk349zc8DNP-fajg@mail.gmail.com>
Subject: Re: [PATCH v2] drivers/mailbox: Add Aspeed mailbox driver
To: Cyril Bur <cyrilbur@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 openbmc@lists.ozlabs.org, 
 Joel Stanley <joel.stan@gmail.com>, Greg KH <greg@kroah.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Tue, 05 Sep 2017 09:10:20 +1000
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
X-List-Received-Date: Mon, 04 Sep 2017 14:43:53 -0000

On Mon, Sep 4, 2017 at 12:47 PM, Cyril Bur <cyrilbur@gmail.com> wrote:
> Hi,
>
> I haven't heard anything about this driver. I'm trying to interpret if
> the silence is because there is something fundamentally wrong with the
> driver or is it because it doesn't use any of the mailbox
> infrastructure it is being ignored.
>
Its the latter.
