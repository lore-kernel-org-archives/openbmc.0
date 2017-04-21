Return-Path: <joel.stan@gmail.com>
Received: from mail-yw0-x242.google.com (mail-yw0-x242.google.com
 [IPv6:2607:f8b0:4002:c05::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3w8KVJ4JstzDqK9
 for <openbmc@lists.ozlabs.org>; Fri, 21 Apr 2017 12:31:03 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="glJD+wII"; 
 dkim-atps=neutral
Received: by mail-yw0-x242.google.com with SMTP id k11so248382ywb.2
 for <openbmc@lists.ozlabs.org>; Thu, 20 Apr 2017 19:31:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:from:date:message-id:subject:to:cc;
 bh=wXhIlid30sgD3G58uo9YuE6DEy+sYNoImMTzk2f/o5o=;
 b=glJD+wIInUA+IDvVzvHDJ7NuqHn/S+uxNpdOEzmrcwTL3dSVAsJR4gmK8IVtNggwr8
 AWmtdQXSba2uuQ8hmRcximpOgKG4+JINISdz5R2yLZijcN2yYKctG6dFf2TOioKnj8lX
 8WR+xBG6eOSA6YfVD7rv+b78qUnI2nyceLBlBDdSy5lEbqmiIILZZZVgat1F10yvM5x/
 4BGlJk67vheWcmz2eyIgv+TuQETcXc6bdGL3W8zg73O9c/znZJxZRKkXhfO3NbhGfclg
 yAU2z6NXlSAINdOD+FW+5tO89gArmSvwgXgGTBMKTwngXwsDcF2KqMuJpqTNYDUz4Qlc
 esVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:from:date:message-id:subject
 :to:cc;
 bh=wXhIlid30sgD3G58uo9YuE6DEy+sYNoImMTzk2f/o5o=;
 b=TjzTwikLu4aLFAsDThMAUHd9sig1iujQrEHumdr/KN3L8XLc8tcskcv2msoAXl/ms1
 9Sgeymg0TiWMetD17Kt/LygvenfmswudWI8aJdCwEtbKeBDMhXzGkEKJCk4FWFQ8w8k9
 fpBPLc8nDt7yGPCbwyuR7DNaQEvG/kxmCCwyek+/lQnWNyDAdvpzPHc9hwAbfJZJU6kt
 a1VV4r/MNl/KGvkaxFTc1s0hxpQ3VqsMRSwRxSAkK5oI4g37gnL+AmrhPKwLomISdxiT
 YLXcNDukgrlZf5JxaPDCiFcy2NnHLMGljrSczHFzA90JI9k1ZI1fYblmKNWMnn5Q9ttP
 VqNA==
X-Gm-Message-State: AN3rC/571ODpaQ86m6yXkqDDkEHZMy9J9Phb0bgaG9n9lK2qVMmzXYEJ
 tu3I2MVuL0WhZhQFQu2Nc6O8W60GMQ==
X-Received: by 10.129.101.3 with SMTP id z3mr8882679ywb.11.1492741861563; Thu,
 20 Apr 2017 19:31:01 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.8.202 with HTTP; Thu, 20 Apr 2017 19:30:41 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 21 Apr 2017 12:00:41 +0930
X-Google-Sender-Auth: E-5AwN1VYBBR8EF8pU-Bxod7dDo
Message-ID: <CACPK8XfFF7tNrLjroNA05-c3pMZWFbiKvHq+oFLjBDSkgqfjDw@mail.gmail.com>
Subject: Switching to 4.10
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Brendan Higgins <brendanhiggins@google.com>, 
 Edward James <eajames@us.ibm.com>
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
X-List-Received-Date: Fri, 21 Apr 2017 02:31:05 -0000

Hello team,

I want to make the 4.10 change happen. We don't have the resource to
be maintaining two trees, and the 4.10 tree has a whole heap of
shinyness - faster network, faster flash access, improved I2C.

To this end I will stop merging patches in to 4.7. Please target the
4.10 tree from here on.

Use this thread to discuss concerns and coordinate the work that needs
to be done. Bits that I'm aware of

 - Eddie is updating userspace to the new FSI APIs
 - I need to merge the upstream FSI patchset
 - Brednan needs to post the lastest version of the i2c patchset which
I will merge
 - I need to merge benh's ftgmac100 improvements

Cheers,

Joel
