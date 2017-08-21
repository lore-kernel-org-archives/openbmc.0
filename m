Return-Path: <sacnaik@gmail.com>
Received: from mail-ua0-x22d.google.com (mail-ua0-x22d.google.com
 [IPv6:2607:f8b0:400c:c08::22d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xbjq55DxtzDqY9
 for <openbmc@lists.ozlabs.org>; Tue, 22 Aug 2017 05:06:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Oq276WJF"; 
 dkim-atps=neutral
Received: by mail-ua0-x22d.google.com with SMTP id k12so12384133uag.3
 for <openbmc@lists.ozlabs.org>; Mon, 21 Aug 2017 12:06:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=Dgn6CqGEj4j7lXn7KST4YAdeaLafu4l5994kGCTCnvw=;
 b=Oq276WJFgboPVM/shvjkC7NDWDd+awvxKPyBwORSuo55JqoLjMP2ZKK5lMRNjY/2oB
 PX51QBQ7zWmBLNSCXlYadiY2Ah5MWVh1tggbV+oGoqkZgwxZDiIVl4f5GHAFENQW2Khj
 5/IyIAL7kqGkTgAJxu/A02X7bLH/T7/QgyWJGNMiVYvWLq7C/2OQ1hw//T3sN+sKbhNr
 sb34okYsuzehCdwuqilhdP1G6s30O6XY4LGV3QdAWbU1pdvXWQSZIdMX3mAOoOHIHcT9
 sJGKgOm9ASzCWd3kaBmwyF8b4NXDTbQrRkYLj57u4sTWlVwJ+2yfltcBLj1m4dGNfRNM
 q+Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=Dgn6CqGEj4j7lXn7KST4YAdeaLafu4l5994kGCTCnvw=;
 b=Q1MgFODbR0GSYwvjWqfb3UFt7Hy9T9kwOjZZYec10XyRqAUzXECES/4JoxDfhDl6KK
 +muBtb+bA0iuBoWUE7kEDktjyJ+EMb2oEJt+8FZ+aliWzNe+uyM8OSEf0vlvRbQAAIdH
 E0/OrijKPbcmsZvyuuyP2AIjZW/lTZI5h7EFFE8gvsh+UMKcD4DvuSx6n9fHgutuemeK
 lfD9xOn5SWVB5HZAPMLN3VSOphsI3EXZF9kMjEVe1GqJHNuidDWXvR2yubrS+PzQO+KA
 c1oMH7RHmHhedNMyNqxD3F2KXds99Cjho4tLyZnxY/by++HBxsxXETXQyEK1vFYoPrJ1
 efMA==
X-Gm-Message-State: AHYfb5jI4QLmVZVCyZSGo8XiZ7/s7IPExtim7nYyfGdWOeKaQ5AcTggp
 1jY3vVP/6Uz+zivWzwC/qZY0fYrypH46
X-Received: by 10.159.32.97 with SMTP id 88mr12251879uam.102.1503342415001;
 Mon, 21 Aug 2017 12:06:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.176.28.30 with HTTP; Mon, 21 Aug 2017 12:06:54 -0700 (PDT)
From: sachin naik <sacnaik@gmail.com>
Date: Mon, 21 Aug 2017 12:06:54 -0700
Message-ID: <CALFfRJOvnOYdj72UfMhFQoF9CH8nZKTYQuxQNEYd7VoSENw_MQ@mail.gmail.com>
Subject: BMC chip
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="94eb2c04ca989f3dca0557482e8e"
X-Mailman-Approved-At: Tue, 22 Aug 2017 10:35:04 +1000
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
X-List-Received-Date: Mon, 21 Aug 2017 19:06:59 -0000

--94eb2c04ca989f3dca0557482e8e
Content-Type: text/plain; charset="UTF-8"

Hi All

Other than Aspeed what other BMC chip is supported by openBMC?

Thanks and regards
Sachin

--94eb2c04ca989f3dca0557482e8e
Content-Type: text/html; charset="UTF-8"

<div dir="ltr">Hi All<div><br></div><div>Other than Aspeed what other BMC chip is supported by openBMC?</div><div><br></div><div>Thanks and regards</div><div>Sachin</div></div>

--94eb2c04ca989f3dca0557482e8e--
