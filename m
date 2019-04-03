Return-Path: <geissonator@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::334; helo=mail-ot1-x334.google.com;
 envelope-from=geissonator@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="QH3R5rN6"; 
 dkim-atps=neutral
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com
 [IPv6:2607:f8b0:4864:20::334])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44Z8f146qCzDqJj
 for <openbmc@lists.ozlabs.org>; Thu,  4 Apr 2019 02:10:33 +1100 (AEDT)
Received: by mail-ot1-x334.google.com with SMTP id 64so15678701otb.8
 for <openbmc@lists.ozlabs.org>; Wed, 03 Apr 2019 08:10:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=YUyUOTWSqnp8FzwEhh1+VCSZho7AaqVcS1lr2idsOms=;
 b=QH3R5rN6OrK8pcXzNwVFzb1hL5jB/qIrP1BoFa1tPgOKDyBI7d9ZVXS1+Lp4UXjpVC
 VoTmk1M//8ecZBEPUDbns2UGhHb67WEBP9rIz4GakwO3y+DsS0qFukPkudI3W1svf8j+
 CTcY8QpMIKA2mxYRoPWricDovmrCpCRcMkLNcF97/iYWVP3g1E1aifOFaZ9wqo6pNnPf
 mGJawM3bfRPAsSre5O8fWnkpsLO91DFm4X70me2LwSx5eT9w3WueLU1/nsxjBXMO3wab
 C8/uiIYWhpiR1FgDWHMw+toLKyr3cY+5D4WsyvxWNDi2Wj/rOVBIJtTqf+J8a+33MGnk
 tLuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=YUyUOTWSqnp8FzwEhh1+VCSZho7AaqVcS1lr2idsOms=;
 b=qeUkH0D+i2Gbm6oHLw0fQKCoY6ZEge0JU1cK2/razoc5Ds1XiYVqb0/Hmn58YTB2YG
 j7LDvU6DxdfLIhpGQ3sqLLoIa0fI2G4BMnqZnymbkkDZFjV4pBNmGSbIyPAQiLYqVQAB
 PUlL2cfCl0Oype2BnsOt54KxgmttvcIA3+Zjx4i3phQBQkJ+sq9eh6Ouzs+C//cOA0f2
 h0BYwy8O5hi/uM7L5g4kf1nW9mBbuDh9vgMD0+dKybl/HtpfVxwICd+BvJPnjQTxMtzI
 2zZcRmKo9wuWEJXXUe/bwOEWkf7UdBw4iHj8OTeVxSyv+yJpg/3M5AhlcXaUMBsZpX6W
 KpZw==
X-Gm-Message-State: APjAAAWOjEE/jbllo+b9wfeJMYFwMZ6EFZjKQDS2eeuZW1X43R86uw7o
 ijIktXp1P3GgeRCl14EFtNu0JZCFFw0FC/0q1v3kTcgqaQA=
X-Google-Smtp-Source: APXvYqwrNeZwjuAdHpKDVYFqIQyU5UPYgjj7nlvVyd2xwPyrYRCYYyp+fqFjpOofgnQzBiBQuZ1tABwSTTinMCWrDeQ=
X-Received: by 2002:a05:6830:c7:: with SMTP id x7mr121786oto.282.1554304229861; 
 Wed, 03 Apr 2019 08:10:29 -0700 (PDT)
MIME-Version: 1.0
From: Andrew Geissler <geissonator@gmail.com>
Date: Wed, 3 Apr 2019 10:10:14 -0500
Message-ID: <CALLMt=prfTPFcnpnN_mqrxsPZ3X4rXyjvxgcVAOcs26zAaHDMg@mail.gmail.com>
Subject: OpenBMC Infrastructure Workgroup Today - New Time (2PM CT)
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Wed, 03 Apr 2019 15:10:34 -0000

Reminder that we've got the infrastructure workgroup meeting
today and it's moved an hour earlier.

https://github.com/openbmc/openbmc/wiki/OpenBMC-Infrastructure-Workgroup

Andrew
