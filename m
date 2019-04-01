Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::533; helo=mail-pg1-x533.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="jkme8Wui"; 
 dkim-atps=neutral
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com
 [IPv6:2607:f8b0:4864:20::533])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44Y21m6Gs2zDqCx
 for <openbmc@lists.ozlabs.org>; Tue,  2 Apr 2019 06:08:44 +1100 (AEDT)
Received: by mail-pg1-x533.google.com with SMTP id p6so5227419pgh.9
 for <openbmc@lists.ozlabs.org>; Mon, 01 Apr 2019 12:08:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wf17hWbCB105Hk5GzgXKzqmml8JsKx14wR0I7gN5q0U=;
 b=jkme8WuivbMw8DofunxClX1bponKvPFceFnS/xQiQMF9YB+kE+NJaN7+zaZo8gZosc
 2MOEjDihXIOoAowNtZXgpyf035KgOVWeSAW0WpLV6fJUO0Ces5vH05TLWkDLx35y21Yn
 NkQvnx0zj2UWdzgxs5W2hTgzKr1yqsCRwfcfECcnjHVWwNplBmIwzxgLYrymBTjlHnPz
 bvgdqlWqaubVT+Z9koiUJco0vZI0MqWRCrX7XD++hYQy7xX7Crl88XGnL6/C0af0c90k
 0cYs3N3ePsmUrFGnMgOv4MLr1tcf4QMlOwunxwRifeTwXn22ozoZj8QIKGGBLdjF1YJv
 QeAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wf17hWbCB105Hk5GzgXKzqmml8JsKx14wR0I7gN5q0U=;
 b=tC3ikbAJ1EWneDyyLtChz2YpI4kO+lkZDkhxcu743u6aw+VTNHVW5Pfjiuri3ufDqS
 P+mO/KSEpd0fgCJJbdux95nt+ABTs4mdXGJj9HQRT8wSSzDEqZDAqISiiwmKgC4APFsn
 SXifYPrWZv18lBS800SI8H9bRx5vZ3ffLhWhDXhf6xK95M9hbaAVJoq/bJb14UQGgWYJ
 6bG+Q0cgOCNUdpRv9vLj1xq/lvyY2IMtcAL+hpROC1864T7DQfGacE6fr5keGei/hNf9
 285bp1CrHDl1j/5f4FMrCd/3SmPhs+HUyh21JIBaqACUWMVy3z7+m8MKPNItek52MRnt
 Gaow==
X-Gm-Message-State: APjAAAVWzuzhnYOSzoV9icJ/+uQy3wu2DzIsbC/6eMpQOb71Lg7+mwj5
 to8GgObLxoKAa5vPVA60SpxtU9lZta4ZShPXxl4zZAmuXCYSJg==
X-Google-Smtp-Source: APXvYqyZQ/zNGITyHBttTIZDP0L21KT5XYoTFTBGyOh7o7ONh5XgSXlL5QPOLwImKhAUMSzwmo2dIQ8LYE22p3UALhU=
X-Received: by 2002:a65:5682:: with SMTP id v2mr8632733pgs.100.1554145722456; 
 Mon, 01 Apr 2019 12:08:42 -0700 (PDT)
MIME-Version: 1.0
References: <CAO=notyEKDUdTWOzJRGiGD_gFycTJbSW=GzF=YCbUW4XJswtpQ@mail.gmail.com>
 <CAPnigKkYDQOyPPotS9d_TbtWXB99-bueODsW_an0SZ-FRPiJRQ@mail.gmail.com>
In-Reply-To: <CAPnigKkYDQOyPPotS9d_TbtWXB99-bueODsW_an0SZ-FRPiJRQ@mail.gmail.com>
From: Patrick Venture <venture@google.com>
Date: Mon, 1 Apr 2019 12:08:30 -0700
Message-ID: <CAO=notwM6xY0qWCxrKw1s9sPhMZnkOuN9_bjG-yP2V-vPUFjLQ@mail.gmail.com>
Subject: Re: wantedby target
To: William Kennington <wak@google.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>
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
X-List-Received-Date: Mon, 01 Apr 2019 19:08:45 -0000

On Mon, Apr 1, 2019 at 12:04 PM William Kennington <wak@google.com> wrote:
>
> It's still unclear to me why we even have obmc-standby.target instead
> of just using multi-user.target. I think it has something to do with
> host power on / off on ibm machines and how they pick which services
> to start. We almost certainly don't want to be using the basic.target
> as that is reserved for core system services and ordered Before all
> targets.

I think this:

https://github.com/openbmc/entity-manager/blob/master/service_files/xyz.openbmc_project.EntityManager.service

and the other service file are the only ones started by basic.target.

I think moving to multi-user.target is a good plan for moving the
service files into the repos -- instead of having it be a configurable
variable.  Just to simplify it.

>
> On Mon, Apr 1, 2019 at 8:20 AM Patrick Venture <venture@google.com> wrote:
> >
> > When moving service files to the repo there is a choice.  To hard-code
> > the wanted by information in the service file, or providing a variable
> > for it that can be set via configuration (via the recipe).
> >
> > There's the default which is obmc-standby.target, there's the more
> > popular multi-user.target and basic.target -- I was curious if there
> > was a consensus or a best practice here?
> >
> > Thanks,
> > Patrick
