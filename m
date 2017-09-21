Return-Path: <a.novikov@yadro.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=yadro.com
 (client-ip=89.207.88.251; helo=mta-01.yadro.com;
 envelope-from=a.novikov@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dkim=fail reason="signature verification failed" (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.b="qLJOLFiW"; 
 dkim-atps=neutral
Received: from mta-01.yadro.com (mta-01.yadro.com [89.207.88.251])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xyZzl65zXzDqZv
 for <openbmc@lists.ozlabs.org>; Thu, 21 Sep 2017 22:04:50 +1000 (AEST)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 8EEA349163
 for <openbmc@lists.ozlabs.org>; Thu, 21 Sep 2017 12:04:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-language:content-transfer-encoding:content-type
 :content-type:mime-version:user-agent:date:date:message-id
 :subject:subject:from:from:received:received:received; s=mta-01;
 t=1505995481; x=1507809882; bh=siENUzQrLjkckiJAkGxgXnuKpMqumEZJ
 L0nTL7ao7O0=; b=qLJOLFiWd0VjY2ibJ22e3jaZHjvlqu1LHGA+OYMPG4F+h5kB
 b3RvD83JiBUyKhBg9L/jWEC7PqD60be8TFDlFBLP5Rnu6IChJ61mh7AEQv9OOBWp
 ZGZjleMbbwOPrhj620QJkSlWeQM52G/DaaHGVIxgyL2NfQ8U3mRfHmztDXU=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cXe87ELt7C9Y for <openbmc@lists.ozlabs.org>;
 Thu, 21 Sep 2017 15:04:41 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com
 [172.17.10.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id A225E49162
 for <openbmc@lists.ozlabs.org>; Thu, 21 Sep 2017 15:04:41 +0300 (MSK)
Received: from [172.17.15.146] (172.17.15.146) by T-EXCH-02.corp.yadro.com
 (172.17.10.102) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Thu, 21
 Sep 2017 15:04:41 +0300
To: <openbmc@lists.ozlabs.org>
From: Anton Novikov <a.novikov@yadro.com>
Subject: Arch Linux compile error
Message-ID: <57a959d5-bf47-a852-2a32-33418dde9329@yadro.com>
Date: Thu, 21 Sep 2017 15:04:41 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.3.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [172.17.15.146]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-02.corp.yadro.com (172.17.10.102)
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
X-List-Received-Date: Thu, 21 Sep 2017 12:04:53 -0000

| /usr/include/bits/types/__locale_t.h:28:8: note: originally defined here
|  struct __locale_struct
|         ^~~~~~~~~~~~~~~
| In file included from glibc/locale/locale.h:145:0,
|                  from ../git/localedef/include/locale.h:1,
|                  from glibc/locale/programs/localedef.h:24,
|                  from glibc/locale/programs/ld-collate.c:29:
| glibc/locale/xlocale.h:39:4: error: conflicting types for ‘__locale_t’
|  } *__locale_t;
|     ^~~~~~~~~~
| In file included from /usr/include/bits/types/locale_t.h:22:0,
|                  from /usr/include/stdlib.h:199,
|                  from glibc/locale/programs/ld-collate.c:24:
| /usr/include/bits/types/__locale_t.h:42:33: note: previous declaration 
of ‘__locale_t’ was here
|  typedef struct __locale_struct *__locale_t;
|                                  ^~~~~~~~~~
| In file included from glibc/locale/locale.h:145:0,
|                  from ../git/localedef/include/locale.h:1,
|                  from glibc/locale/programs/localedef.h:24,
|                  from glibc/locale/programs/ld-collate.c:29:
| glibc/locale/xlocale.h:42:20: error: conflicting types for ‘locale_t’
|  typedef __locale_t locale_t;
|                     ^~~~~~~~
| In file included from /usr/include/stdlib.h:199:0,
|                  from glibc/locale/programs/ld-collate.c:24:
| /usr/include/bits/types/locale_t.h:24:20: note: previous declaration 
of ‘locale_t’ was here
|  typedef __locale_t locale_t;
|                     ^~~~~~~~
| glibc/locale/programs/charmap.c: In function ‘charmap_read’:
| glibc/locale/programs/charmap.c:202:39: warning: passing argument 1 of 
‘__xpg_basename’ discards ‘const’ qualifier from pointer target type 
[-Wdiscarded-qualifiers]
|      result->code_set_name = basename (filename);
|                                        ^~~~~~~~
| In file included from ../git/localedef/include/string.h:4:0,
|                  from glibc/locale/programs/charmap.c:28:
| /usr/include/libgen.h:34:14: note: expected ‘char *’ but argument is 
of type ‘const char *’
|  extern char *__xpg_basename (char *__path) __THROW;
|               ^~~~~~~~~~~~~~
| make: *** [Makefile:66: charmap-dir.o] Error 1
| make: *** Waiting for unfinished jobs....
| make: *** [Makefile:66: charmap.o] Error 1
| make: *** [Makefile:66: ld-address.o] Error 1
| make: *** [Makefile:66: ld-collate.o] Error 1
| WARNING: 
/home/openbmc/openbmc/build/tmp/work/x86_64-linux/cross-localedef-native/2.24-r0/temp/run.do_compile.3987:1 
exit 1 from 'exit 1'
| ERROR: Function failed: do_compile (log file is located at 
/home/openbmc/openbmc/build/tmp/work/x86_64-linux/cross-localedef-native/2.24-r0/temp/log.do_compile.3987)
ERROR: Task 
(/home/openbmc/openbmc/meta/recipes-core/glibc/cross-localedef-native_2.24.bb:do_compile) 
failed with exit code '1'
