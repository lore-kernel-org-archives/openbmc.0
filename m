Return-Path: <geissonator@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4003:c06::235; helo=mail-oi0-x235.google.com;
 envelope-from=geissonator@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="SUzrU4FW"; 
 dkim-atps=neutral
Received: from mail-oi0-x235.google.com (mail-oi0-x235.google.com
 [IPv6:2607:f8b0:4003:c06::235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 426VHh4nQ0zF3Tp
 for <openbmc@lists.ozlabs.org>; Sat,  8 Sep 2018 07:02:08 +1000 (AEST)
Received: by mail-oi0-x235.google.com with SMTP id 13-v6so29800667ois.1
 for <openbmc@lists.ozlabs.org>; Fri, 07 Sep 2018 14:02:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=NWLY1FxxwM8lMGIZJXdJXhfEpQxVB7Fk2qfjNSDX0f4=;
 b=SUzrU4FWAvVdN3FbQ/SyhMyzbDYXhalY5DiI70l51fYkTRb5yBeSWLBKD/Pzpn9byk
 THtftf1WeuntFujBjsWp6i27XLnb/ZaVOy77KD8oJFQPc3MH3lvpW+O27ZdQw2IqbLgK
 Rckkft4acr3SZNpefj/yPOrWwG1QLLC1q7w/mJrifC8vOLQkzDFJZRKSPbO5aYlByRqU
 fnwmRLQrLclNzH2LsFsQ4OwFKVSoA9bG65wUvAImpCTsXFl7OjKfamIgkTcLfLO0pprP
 eN8oVAJCNnvUfkepy83NzZZUvBngmckrZVczwu1/LePj0r/nH0JhjRkBZ3NJDy2om3sv
 L8Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=NWLY1FxxwM8lMGIZJXdJXhfEpQxVB7Fk2qfjNSDX0f4=;
 b=kFvKcBnJb9KwNtTXPzE105eJNezwQvC6zj5MguSnaZeQcw1zkRc1SFE4kTBYFtzVGD
 7EU4YBZqSE+52WyVVmYa0MpJZr6ibvP+nd55Gy6UhGjRbfzzbMdDODk/mj+P2t9iZTId
 ZiKOCmGvvUh3t4b6EVesa6BEjtdCsV+K2nwS6RHZ7xuh/kywUaa8+OlGt8O/H7uvasbm
 bnnYJalPgN2i0n7QJDu/FmfRwZnMCVSCMwmi9O/iezMZrksfaXvqgz+O3QujY7ii5z/p
 /h2vfh+GYmxiWb3KP8GyEpFoamtlE9npmgN1CQI+qjuS/VTT2FBiBnRiN5Rd9Bz0J4La
 gNOA==
X-Gm-Message-State: APzg51D9+06TAJqk/uJJTgrh8xdOiZfcEr6tFp5snoPqdelo7ZT5naj/
 nKcmJ4p/0+63f32N5Fp/n7RA5f/DAbD+tFBEjlIZFkma
X-Google-Smtp-Source: ANB0Vdbkgb77qYYnmxqu1pXd+Gw9PznabYQIEe8ZQV1lwQAUE7mAlnGUhptYYj7uaiXs8t5E9/k/glj/5xBbu9qx9Wk=
X-Received: by 2002:aca:5d07:: with SMTP id
 r7-v6mr9131753oib.146.1536354125951; 
 Fri, 07 Sep 2018 14:02:05 -0700 (PDT)
MIME-Version: 1.0
From: Andrew Geissler <geissonator@gmail.com>
Date: Fri, 7 Sep 2018 16:01:54 -0500
Message-ID: <CALLMt=qBQijU21UAETe6UTtOXFFrAyQe01QBAxuRjm7-pYGnxA@mail.gmail.com>
Subject: HW CI Disabled due to flash image size issues
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.27
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 07 Sep 2018 21:02:10 -0000

We've been riding right on the edge of fitting our witherspoon images
within the available flash chip size for a while now.  Yesterday we
drove over that edge. We had the new phosphor-tiny distro feature
about ready (https://gerrit.openbmc-project.xyz/#/c/openbmc/openbmc/+/12581/)
so got that in this morning hoping it would fix things.

Something went wrong though and we lost our UBI filesystem support
when officially enabling this feature on witherspoon.  Debug is
ongoing but for now HW CI is disabled.

Will keep everyone in the loop.  Once we do get this tiny feature in
we'll need people to rebase any changes they have on it.  Any
contributions to the new phosphor-tiny distro feature are also
appreciated.  Initially it just removes some of the .py files from the
python packages, which got us back about 1MB of rofs space.

Andrew
