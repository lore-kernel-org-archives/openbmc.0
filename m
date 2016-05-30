Return-Path: <sam.mj@au1.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rJXhH2p32zDqYc
 for <openbmc@lists.ozlabs.org>; Tue, 31 May 2016 09:22:07 +1000 (AEST)
Received: from pps.filterd (m0075771.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.11/8.16.0.11) with SMTP id
 u4UNEQaO012122
 for <openbmc@lists.ozlabs.org>; Mon, 30 May 2016 19:22:05 -0400
Message-Id: <201605302322.u4UNEQaO012122@mx0a-001b2d01.pphosted.com>
Received: from e23smtp05.au.ibm.com (e23smtp05.au.ibm.com [202.81.31.147])
 by mx0a-001b2d01.pphosted.com with ESMTP id 238hnc1q3q-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 30 May 2016 19:22:05 -0400
Received: from localhost
 by e23smtp05.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <sam.mj@au1.ibm.com>;
 Tue, 31 May 2016 09:22:02 +1000
Received: from d23dlp02.au.ibm.com (202.81.31.213)
 by e23smtp05.au.ibm.com (202.81.31.211) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Tue, 31 May 2016 09:22:01 +1000
X-IBM-Helo: d23dlp02.au.ibm.com
X-IBM-MailFrom: sam.mj@au1.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from d23relay07.au.ibm.com (d23relay07.au.ibm.com [9.190.26.37])
 by d23dlp02.au.ibm.com (Postfix) with ESMTP id 8C9A62BB0055
 for <openbmc@lists.ozlabs.org>; Tue, 31 May 2016 09:22:00 +1000 (EST)
Received: from d23av05.au.ibm.com (d23av05.au.ibm.com [9.190.234.119])
 by d23relay07.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u4UNLq6Q41746464
 for <openbmc@lists.ozlabs.org>; Tue, 31 May 2016 09:22:00 +1000
Received: from d23av05.au.ibm.com (localhost [127.0.0.1])
 by d23av05.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u4UNLS7L004155
 for <openbmc@lists.ozlabs.org>; Tue, 31 May 2016 09:21:28 +1000
Received: from ozlabs.au.ibm.com (ozlabs.au.ibm.com [9.192.253.14])
 by d23av05.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 u4UNLS5e003773; Tue, 31 May 2016 09:21:28 +1000
Received: from localhost (unknown [9.192.175.214])
 (using TLSv1.2 with cipher AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 15F86A0132;
 Tue, 31 May 2016 09:21:03 +1000 (AEST)
Date: Tue, 31 May 2016 09:21:02 +1000
From: Samuel Mendoza-Jonas <sam@mendozajonas.com>
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>
Cc: openbmc@lists.ozlabs.org
Subject: Re: [PATCH ipmi-fru-parser] Replacing std::ifstream by access(2) for
 checking file existence
References: <20160530082014.21716-1-openbmc-patches@stwcx.xyz>
 <20160530082014.21716-2-openbmc-patches@stwcx.xyz>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20160530082014.21716-2-openbmc-patches@stwcx.xyz>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16053023-0016-0000-0000-0000019FDA45
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 16053023-0017-0000-0000-000004BB6010
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2016-05-30_13:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=7
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1604210000
 definitions=main-1605300280
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 30 May 2016 23:22:07 -0000

On Mon, May 30, 2016 at 03:20:14AM -0500, OpenBMC Patches wrote:
> From: vishwa <vishwanath@in.ibm.com>
> 
> ---
>  writefrudata.C | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/writefrudata.C b/writefrudata.C
> index 7ee2127..6e28341 100644
> --- a/writefrudata.C
> +++ b/writefrudata.C
> @@ -663,7 +663,7 @@ int ipmi_validate_fru_area(const uint8_t fruid, const char *fru_file_name,
>                           (fruid, get_fru_area_type(fru_entry), bus_type, bmc_fru);
>  
>          // Physically being present
> -        bool present = std::ifstream(fru_file_name);
> +        bool present = (access(fru_file_name, F_OK) != -1) ? true : false;

Hi Vishwa,

Since (access(..) != -1) returns a boolean you can simplify this to:

        bool present = access(fru_file_name, F_OK) != -1;

>          fru_area->set_present(present);
>  
>          // Only setup dbus path for areas defined in BMC.
> -- 
> 2.8.3
> 
> 
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
