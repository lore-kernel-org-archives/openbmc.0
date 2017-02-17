Return-Path: <joel.stan@gmail.com>
Received: from mail-yb0-x241.google.com (mail-yb0-x241.google.com
 [IPv6:2607:f8b0:4002:c09::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vPckm04wzzDqBW
 for <openbmc@lists.ozlabs.org>; Fri, 17 Feb 2017 13:42:40 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="A7kLhUsR"; 
 dkim-atps=neutral
Received: by mail-yb0-x241.google.com with SMTP id 123so1313329ybe.0
 for <openbmc@lists.ozlabs.org>; Thu, 16 Feb 2017 18:42:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=uNEIHVtsEFSjqtjqS1QMIm9qjHdZIFfpUnmUoBHjQTU=;
 b=A7kLhUsRNEIomNd57zuHBm50wlRxOB0oiZBwrG9BNwrzy7uJwgPMT5IWUsQzrbKGwO
 +GaPXReAbHyZzB6BVTWrF5pxfJg8Dqev5NFCye8RScgHeGemWc/NXq25aK65KFYWiW9v
 HX8Kh/mOm12KDhZU288un/R6ZVO6rmWZw6ZTrElCNyulU2qZsBPlPyISLeeHmF9znbIb
 SzXKUCXPbALoQ4hIgMzP4izWN3LtWBL3JRihBV2o1YTweZBst4cI01SThmLQev/KOSh7
 aI4cVT6Wb5RLebzjAwH5mPzVbFBkl9m9fbC34ENFV1iyRWNWGCbx0BMUBtqHE0T0LJrC
 Kn5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=uNEIHVtsEFSjqtjqS1QMIm9qjHdZIFfpUnmUoBHjQTU=;
 b=PCrYqQ5V4mIyREuACeIZutymeca4hhl666FvkyZYlbEswgz8pqXWd3omZiYPiHhunq
 of0TwqA1CRkNVXTeFme5o3ePiGVNisqI4seGuDsPnZz+FgHgcsonlVxqw/4su+dn3v55
 Q/C5WhW+mO97D5RWbEhkjLaF6VQDQu9YxMEKb9CnzdQ8YcnOa6UnyWaRXOd7wUmNfjeW
 tHZYlIIeQMO3tNLOzJMJ5HqFlHaKKEYzlQqrKma8mrYFgeHwuKGbgxrSS0oOEwQ0IwFu
 I5XPuBlGDVOK/X7Ah2rR+OJxB3ibzdlXQg0EUPDoayK/XFUxs8SBkCDHTYaLSf8c/syH
 mPUw==
X-Gm-Message-State: AMke39lwUHuoRVFU7K0gX+LFcu5lLmfbNk18nQ3tFCn4DuywzdSjs6LRmkF8Ffj9kHHrmiZuzSTfFOr9/hkQeg==
X-Received: by 10.37.3.132 with SMTP id 126mr4075268ybd.15.1487299357577; Thu,
 16 Feb 2017 18:42:37 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.170.41 with HTTP; Thu, 16 Feb 2017 18:42:17 -0800 (PST)
In-Reply-To: <20170214063000.23692-1-cyrilbur@gmail.com>
References: <20170214063000.23692-1-cyrilbur@gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 17 Feb 2017 13:12:17 +1030
X-Google-Sender-Auth: D95330-_pp8KjKZO2HRIC_dhQhA
Message-ID: <CACPK8XcNXOL6620QYB1oJeKP05eqhnWyQovLGzVy3ZY=w=ndKg@mail.gmail.com>
Subject: Re: [PATCH v5] drivers/misc: Add Aspeed LPC control driver
To: Cyril Bur <cyrilbur@gmail.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, 
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Michael Neuling <mikey@neuling.org>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset=UTF-8
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
X-List-Received-Date: Fri, 17 Feb 2017 02:42:40 -0000

On Tue, Feb 14, 2017 at 5:00 PM, Cyril Bur <cyrilbur@gmail.com> wrote:
> diff --git a/drivers/misc/aspeed-lpc-ctrl.c b/drivers/misc/aspeed-lpc-ctrl.c
> new file mode 100644
> index 000000000000..9b51548e9d81
> --- /dev/null
> +++ b/drivers/misc/aspeed-lpc-ctrl.c

> +static long aspeed_lpc_ctrl_ioctl(struct file *file, unsigned int cmd,
> +               unsigned long param)
> +{
> +       struct aspeed_lpc_ctrl *lpc_ctrl = file_aspeed_lpc_ctrl(file);
> +       void __user *p = (void __user *)param;
> +       struct aspeed_lpc_ctrl_mapping map;
> +       u32 addr;
> +       u32 size;
> +       long rc;
> +
> +       if (copy_from_user(&map, p, sizeof(map)))
> +               return -EFAULT;

The structure you pass has a flags field that is currently unused. You
should check the value of map->flags here and reject non-zero values.

Once you fix that I think it's in good shape.

Cheers,

Joel
