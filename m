Return-Path: <kurt.r.taylor@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::22f; helo=mail-oi1-x22f.google.com;
 envelope-from=kurt.r.taylor@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="CiAKkyE3"; 
 dkim-atps=neutral
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com
 [IPv6:2607:f8b0:4864:20::22f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42v25N2BZCzF3Hc
 for <openbmc@lists.ozlabs.org>; Tue, 13 Nov 2018 07:13:44 +1100 (AEDT)
Received: by mail-oi1-x22f.google.com with SMTP id g188-v6so8271822oif.8
 for <openbmc@lists.ozlabs.org>; Mon, 12 Nov 2018 12:13:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=to:from:subject:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=KzF0+6ugeeglKToDUApkcupt7T1AbuMXo8nttqINqFk=;
 b=CiAKkyE3Wq3WjWFV1iYEEkzAOtTJrRnVZZVRetA7xV+4WI+Jt8J/v6GCeU0gBdG3mL
 zqEgBF4gpWk4GeXp5L0orFjRKm90A0QGucl2yH/psnY4YnQzjwakRDNeG/a24Bek95Yb
 5bLGYP2HzKuDDCBVKL5tiQuqPZy/bLpH9u89WrT/VlUpzMFrXioIXq78NwAwvk0V9dC7
 KV22YMn+1VY/hsaQ9QpQChB8/yGYU1orEd4nfHwwOJ8h5Na7lDiqrK1lJ/cBp22Lf+OK
 vmtXUvLR2ZM0T/08M0MEgSCNw/D9W350K268hcRtJFosGDNMLVovbz1sQSLA8gPaNtae
 P4SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:from:subject:message-id:date:user-agent
 :mime-version:content-language:content-transfer-encoding;
 bh=KzF0+6ugeeglKToDUApkcupt7T1AbuMXo8nttqINqFk=;
 b=kckr6ei+ajt7lS+DH9BJT4Ltn5SXWyx+ndJPGN8n+JdaJzRKzlrQOlXmEVaJ5YdYfK
 MTPeZF+d5jfAC2FleWPOdEw/LVye/zz6cX+uPTWAGzg7claLZQL5hH430fDH7BhhE4bR
 gEN19/c23ouO5v075080LPW4oHVISkOIdo741colsvCTEF/cTe8uNzJxSXZnxQow37lx
 HvzJs5YoKXGRpeTT7rcroHvfvSDRT4ErdQvDNzydXrtowZYaZAzDYw1H2+QJXJiCe0Rx
 KGqbpQgACQza2v0/zKu0TvhmsmL4jGj6HcASTtshR0oyRviI1Ek3lvLrYZ2Mm1QXz/As
 l3gA==
X-Gm-Message-State: AGRZ1gJ5gxa4D/vCee1GOoQhXCDD+PwM3+kfXVfh4dN3edJwAq0i8tto
 cVq6KJbjlCud9/1vMMOhMnG9JEbj
X-Google-Smtp-Source: AJdET5dsLJ0NBqqoe6Kd2PA0qP6w4UVtbx8osit34YQeGqKrDQkZcRkXVnxC379outSaXNlYpymAlg==
X-Received: by 2002:aca:32c6:: with SMTP id
 y189-v6mr1261229oiy.153.1542053621810; 
 Mon, 12 Nov 2018 12:13:41 -0800 (PST)
Received: from krtaylors-MacBook-Pro.local (072-182-100-019.res.spectrum.com.
 [72.182.100.19])
 by smtp.gmail.com with ESMTPSA id e24sm7946617otd.63.2018.11.12.12.13.41
 for <openbmc@lists.ozlabs.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 12 Nov 2018 12:13:41 -0800 (PST)
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
From: krtaylor <kurt.r.taylor@gmail.com>
Subject: Next Release Planning WG meeting Nov 19th
Message-ID: <fd50ebf0-caf5-7ade-9616-7c319b7ade54@gmail.com>
Date: Mon, 12 Nov 2018 14:13:40 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.3.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
X-List-Received-Date: Mon, 12 Nov 2018 20:13:45 -0000

Following the lead of the Community call this morning - anyone object to 
canceling the Release Planning WG meeting next Monday (the week of 
Thanksgiving US Holiday)?

Please let me know if you'd like to before Wednesday, else I'll cancel.

Thanks,
Kurt Taylor (krtaylor)
