Return-Path: <cyrilbur@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400e:c05::231; helo=mail-pg0-x231.google.com;
 envelope-from=cyrilbur@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="rfEtbJaw"; 
 dkim-atps=neutral
Received: from mail-pg0-x231.google.com (mail-pg0-x231.google.com
 [IPv6:2607:f8b0:400e:c05::231])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xmR8l4k4KzDqh5
 for <openbmc@lists.ozlabs.org>; Tue,  5 Sep 2017 09:37:27 +1000 (AEST)
Received: by mail-pg0-x231.google.com with SMTP id d8so4537970pgt.4
 for <openbmc@lists.ozlabs.org>; Mon, 04 Sep 2017 16:37:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=59i3F4Sy+aLekYFVIiWMrg2Jtrb8/pWFqmuaO6mQ2S0=;
 b=rfEtbJawgKRUiAbhsPzbt/vW3D+k85o4ANk2uppG33IdeHfT53gzHmmPbhj7DIvtIG
 YFrIHgimEPRJvv7/iyP5mcc9jyKnlAD2bA8AtF7tqn8hmiNJT6z1Zv3hWBpBLfsvh3iC
 t7LWz1kz2yVGdXRg93aRPhyFJTummG6X2KIKiDWV8QKpOXZGJI2mDMB5w1+LjLoESu8S
 hCzqaWRlPm+8z69+5k0Q8gC5DS6DT06UvSnfbTqaYYgfStm0TVrkFnIkp2+yGFrQqQ3l
 e2u9nPIqN2Exun0Jk3gFkYec46Nag0N6q7Wvv0hB2uOuEAsMW2xYAnNSVeCLhf41uX/y
 s/EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=59i3F4Sy+aLekYFVIiWMrg2Jtrb8/pWFqmuaO6mQ2S0=;
 b=j2zfxVXQygukTAOcSAjk1FRtxOsJPpKypFJy4Cs6h6ZRbEs7A4pvGN04PxEN54yeBd
 Ptm0Y5dgtGPWNy/mEk3INEKHWobbvrv5FaR0o0U3NB92XgytRs539I1fDqYBw9jEZTx8
 X/KtnHtK/C2yGgD5M4vkVsLzzleaYarGSFFQ9t8ceGEJGtyzTlL3YMej35MEhenAPKha
 sZUpeljCD8bMAah/OiKeZBhFzCaUgpEOb4Udz3zE5GfBSgMj4MTlKV/jZu8JNVJFeSmx
 jjWqWIBOvbASrihY8h2EQxwQiRcEIVCV/WVwx6ZMsue0pHLsnQTDOEVpkIsTxSDQptsY
 pe7w==
X-Gm-Message-State: AHPjjUg+fZ1FOnrd043/Kc/msgDlhIJMrPbVEMZx9fk5k34IKolB2588
 5GE66WnwglEcCA==
X-Google-Smtp-Source: ADKCNb5GneTUvbAqDGjf58WjnUUnbccogeHmsXIZFntqFVcrArUUB5foWopwhMx1wVN+l7U2FctRNw==
X-Received: by 10.99.4.88 with SMTP id 85mr2070381pge.410.1504568244992;
 Mon, 04 Sep 2017 16:37:24 -0700 (PDT)
Received: from camb691.ozlabs.ibm.com ([122.99.82.10])
 by smtp.googlemail.com with ESMTPSA id q9sm12987679pgs.45.2017.09.04.16.37.22
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 04 Sep 2017 16:37:24 -0700 (PDT)
Message-ID: <1504568239.7626.1.camel@gmail.com>
Subject: Re: [PATCH v2] drivers/mailbox: Add Aspeed mailbox driver
From: Cyril Bur <cyrilbur@gmail.com>
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 openbmc@lists.ozlabs.org, Joel Stanley <joel.stan@gmail.com>, Greg KH
 <greg@kroah.com>
Date: Tue, 05 Sep 2017 09:37:19 +1000
In-Reply-To: <CABb+yY3K4AbqqHZuKqquOrN-gCQeRTvh2Ahk349zc8DNP-fajg@mail.gmail.com>
References: <20170207233623.18737-1-cyrilbur@gmail.com>
 <1504509469.4080.6.camel@gmail.com>
 <CABb+yY3K4AbqqHZuKqquOrN-gCQeRTvh2Ahk349zc8DNP-fajg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.24.5 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
X-List-Received-Date: Mon, 04 Sep 2017 23:37:28 -0000

On Mon, 2017-09-04 at 20:13 +0530, Jassi Brar wrote:
> On Mon, Sep 4, 2017 at 12:47 PM, Cyril Bur <cyrilbur@gmail.com> wrote:
> > Hi,
> > 
> > I haven't heard anything about this driver. I'm trying to interpret if
> > the silence is because there is something fundamentally wrong with the
> > driver or is it because it doesn't use any of the mailbox
> > infrastructure it is being ignored.
> > 
> 
> Its the latter.

Great! Thanks for your response, I'll resend it under char/misc.

Kind regards,

Cyril
