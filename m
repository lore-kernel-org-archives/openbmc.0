Return-Path: <SRS0=dV+q=IA=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6B95C433DB
	for <openbmc@archiver.kernel.org>; Tue,  2 Mar 2021 06:17:25 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CDACA6023C
	for <openbmc@archiver.kernel.org>; Tue,  2 Mar 2021 06:17:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CDACA6023C
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=hcl.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DqRkC0Wmmz3cVQ
	for <openbmc@archiver.kernel.org>; Tue,  2 Mar 2021 17:17:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=HCL.COM header.i=@HCL.COM header.a=rsa-sha256 header.s=selector2 header.b=gb1JYUMO;
	dkim=pass (2048-bit key) header.d=HCL.COM header.i=@HCL.COM header.a=rsa-sha256 header.s=selector2 header.b=gb1JYUMO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=hcl.com
 (client-ip=40.107.132.114; helo=apc01-pu1-obe.outbound.protection.outlook.com;
 envelope-from=jayashree-d@hcl.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=HCL.COM header.i=@HCL.COM header.a=rsa-sha256
 header.s=selector2 header.b=gb1JYUMO; 
 dkim=pass (2048-bit key) header.d=HCL.COM header.i=@HCL.COM
 header.a=rsa-sha256 header.s=selector2 header.b=gb1JYUMO; 
 dkim-atps=neutral
Received: from APC01-PU1-obe.outbound.protection.outlook.com
 (mail-eopbgr1320114.outbound.protection.outlook.com [40.107.132.114])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DqRjb5rnsz30LX
 for <openbmc@lists.ozlabs.org>; Tue,  2 Mar 2021 17:16:48 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=HCL.COM; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7MGZiNeLFInxSn7jtHHNXbqfrP1ZHyvKxMlGQgnfgGU=;
 b=gb1JYUMOn13sjSMdIJdZDIsT5j88oc4OBtJucQ9YiuPrK1ka3ERD9aHm848kRXDC182rc1gdGn91fiM+RMkXLMze2IBtX/6eRRdgm2uPJKQGBWrb/POhLNpT14g7FV0QBCkC3bZBHZm1oNiFbhYcQxTNuSSekqECsDl1zNHfbGmx+uEp1jJJLU1AX6H09YQxeR7qWnjPYUouuS+AVH12QXPai6PvfNVVs89cMlbWhqEzSrlfzxdIG+WUtB+Sl2zm5NTwH6lsVDzyD+wqu9wOYm6A9oc1PdkRxqvJFwqsJnZyMvPDXhVDd1cQycFojZyhLiqMgJsoOqW22Dkco8lMYA==
Received: from PS2PR02CA0017.apcprd02.prod.outlook.com (2603:1096:300:41::29)
 by SG2PR04MB2953.apcprd04.prod.outlook.com (2603:1096:4:1f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.20; Tue, 2 Mar
 2021 06:16:38 +0000
Received: from PU1APC01FT013.eop-APC01.prod.protection.outlook.com
 (2603:1096:300:41:cafe::d5) by PS2PR02CA0017.outlook.office365.com
 (2603:1096:300:41::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.20 via Frontend
 Transport; Tue, 2 Mar 2021 06:16:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.8.195.57)
 smtp.mailfrom=hcl.com; google.com; dkim=pass (signature was verified)
 header.d=HCL.COM;google.com; dmarc=pass action=none header.from=hcl.com;
Received-SPF: Pass (protection.outlook.com: domain of hcl.com designates
 192.8.195.57 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.8.195.57; helo=APC01-PU1-obe.outbound.protection.outlook.com;
Received: from APC01-PU1-obe.outbound.protection.outlook.com (192.8.195.57) by
 PU1APC01FT013.mail.protection.outlook.com (10.152.252.78) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3890.19 via Frontend Transport; Tue, 2 Mar 2021 06:16:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iZN3BV1jFEAcHugCeMdtH8DiASNnb5C4lo2sRsUOa1taQ6IEnIyT47J16FKb9a/mx1VtCGqpO7p82eRl6M9DaN0okwlpsPUTZ86w2JKPGZr3YxhxvL8oUFuc38QMLXU7iQxotKr2rPzwBQFUKjLiWpmtV6yQuTtlAjk2g5lNkdSWYZtDU/SSBPAhSi9+uVQLlaTUeSkPxeoFKJmhuXJWNzhDSh4B2x4rZplGvJETLKtnVzpTtYL7U/JjpZpYQB1T7VcvnGkURPHDIoWVe4n5TqnIibOj/7JQpEPwRnVaFP+Up2NAyGOsO8GXP4RoVUSuW4a/KlZxGIW9slJsHqtEjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7MGZiNeLFInxSn7jtHHNXbqfrP1ZHyvKxMlGQgnfgGU=;
 b=m/WScKG4bkeLyMaQ87yX8YfOuihcJwcbgleR25jEtvjtPu8fynqYbn9ucz76rZsnR9Tfk6B4LC/oUr84n/4nHiw7uBPW0BJnudb9u/qKruXUXy/wvv6ALu08qW6KNiBJJ9Ys9s5AJQJ6s2vovZKTo+0xWlBo5ctxrrNFIMVyhts7RUrThvmvmCCevGcgWFc/gLFccSsYlNSshpumjkHv+zkWy8j/6NwI9sA2dmILV4pyCXvOo8Cj7Fgduc60RJ0e/6OmZXIWBu1Zx1Z9FfVQvJ/lH8P9wz+twMB1Ro46dKwwzzYWy643/BkhmT3L3XOGT0D0CpoA/4nQS//vP0+JEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hcl.com; dmarc=pass action=none header.from=hcl.com; dkim=pass
 header.d=hcl.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=HCL.COM; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7MGZiNeLFInxSn7jtHHNXbqfrP1ZHyvKxMlGQgnfgGU=;
 b=gb1JYUMOn13sjSMdIJdZDIsT5j88oc4OBtJucQ9YiuPrK1ka3ERD9aHm848kRXDC182rc1gdGn91fiM+RMkXLMze2IBtX/6eRRdgm2uPJKQGBWrb/POhLNpT14g7FV0QBCkC3bZBHZm1oNiFbhYcQxTNuSSekqECsDl1zNHfbGmx+uEp1jJJLU1AX6H09YQxeR7qWnjPYUouuS+AVH12QXPai6PvfNVVs89cMlbWhqEzSrlfzxdIG+WUtB+Sl2zm5NTwH6lsVDzyD+wqu9wOYm6A9oc1PdkRxqvJFwqsJnZyMvPDXhVDd1cQycFojZyhLiqMgJsoOqW22Dkco8lMYA==
Received: from SG2PR04MB3093.apcprd04.prod.outlook.com (2603:1096:4:6d::11) by
 SG2PR04MB3769.apcprd04.prod.outlook.com (2603:1096:4:a2::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3890.20; Tue, 2 Mar 2021 06:16:33 +0000
Received: from SG2PR04MB3093.apcprd04.prod.outlook.com
 ([fe80::b84d:4fa9:f44b:a049]) by SG2PR04MB3093.apcprd04.prod.outlook.com
 ([fe80::b84d:4fa9:f44b:a049%3]) with mapi id 15.20.3890.029; Tue, 2 Mar 2021
 06:16:33 +0000
From: Jayashree D <jayashree-d@hcl.com>
To: Ed Tanous <edtanous@google.com>
Subject: RE: Negative value returns for sensor in tiogapass
Thread-Topic: Negative value returns for sensor in tiogapass
Thread-Index: AdcMHNUlzX6I6Je8Q2WRGNkpWs0ATgAP1CQAALO8moA=
Date: Tue, 2 Mar 2021 06:16:33 +0000
Message-ID: <SG2PR04MB30938A49324D375CA3B6E257E1999@SG2PR04MB3093.apcprd04.prod.outlook.com>
References: <SG2PR04MB30939CC20F08C50A7031DBA5E19D9@SG2PR04MB3093.apcprd04.prod.outlook.com>
 <CAH2-KxA4tQvaxzFcAWYhYrq9WeCLrLTRdknZW66XUBzOipoFrg@mail.gmail.com>
In-Reply-To: <CAH2-KxA4tQvaxzFcAWYhYrq9WeCLrLTRdknZW66XUBzOipoFrg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL2hjbCIsImlkIjoiNTdiODJkYTItODY0Yi00NzQyLTk3YmItM2NhNjU2NTAzNGJkIiwicHJvcHMiOlt7Im4iOiJIQ0xDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiSENMX0NsYTVzX0MwbmYxZGVudDFhbCJ9XX1dfSwiU3ViamVjdExhYmVscyI6W10sIlRNQ1ZlcnNpb24iOiIxOC40LjE4NDMuMTIzIiwiVHJ1c3RlZExhYmVsSGFzaCI6IjErOHlwNEQ2cytOd0d3VlwvY3d6UjBYYXY4MGw4RnU1MHlSUGZITkErbGN2dlhPblFcL1loekVVVElRbVdjQzZqRCJ9
x-hclclassification: HCL_Cla5s_C0nf1dent1al
Authentication-Results-Original: google.com; dkim=none (message not signed)
 header.d=none;google.com; dmarc=none action=none header.from=hcl.com;
x-originating-ip: [2409:4072:6e88:99e2:d49c:9c69:a5dd:91c5]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 9655a8fc-c6f6-4a92-47c1-08d8dd42bcf2
x-ms-traffictypediagnostic: SG2PR04MB3769:|SG2PR04MB2953:
X-Microsoft-Antispam-PRVS: <SG2PR04MB2953881F372E0BD18510E107E1999@SG2PR04MB2953.apcprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: h3sH8N7HrjNG5MwV4Lrv2tU3NadpubtcG+ir4832xdfiT9f/DAIQdssoGyW6e3L6erDSWzYyTLOIveQnfG4x0U4LwKIkr1TsuHDqTXiO2uHWmHOHmeHxR6+baOoKJ2DAOc7UDvm0kC0TG1datSvpiYjQAoL7ZCRQTjjj6uLB6Shby3LHjP3V8DvexswVc3HGVwj1HORzDKFjica/upe/+uGM7vGi7D8tilJlwpMDL5Q6F2ML1py0hItAKpA3v6nYvMG1TLFd/NSJF6CYKTRZf4DXPVsj3oZtcmMxVPbWHxvcXC7x+epmHzWkCWuVCOqdy91ff0bK8aO0Khd1StCp7PFNdWgod63T7KMVamJnEUfp/WbTTxcfcJftlLSN5oPR6N/4C0JOMis7slJpIIB3ImR254BwnA4Gj1+PkRbIZtar5nclGuvRaZr0n4iJwkDarG5m9yD+TCje3FPyLXSLaw2ANm7xz7VRX3k4lJNQadkah4KxbsUogYkD1YQTq6TSqwl2EANwLe4Y0QhxqPWWRA==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:SG2PR04MB3093.apcprd04.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(4636009)(396003)(136003)(39860400002)(366004)(376002)(346002)(86362001)(478600001)(4326008)(186003)(9686003)(71200400001)(55016002)(83380400001)(8676002)(33656002)(8936002)(6916009)(76116006)(64756008)(66556008)(66446008)(66476007)(66946007)(52536014)(2906002)(316002)(6506007)(7696005)(53546011)(5660300002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?cVlFd0lmUjh5NXc5MHFjRDBmdDFmTzFVVWc5a3pUNEtoUndheFdvOVBtbUFN?=
 =?utf-8?B?U0hWcWRaYVRQZHRmdGQybFhmcTQ0b1JCcHRLUUkzbkpsRDl3dFhWSENjb2JH?=
 =?utf-8?B?YnVLaElRM2J1VTVuWXFmTWlHdjNrd1k2RE91aXlCc3FtWlFkdHh6aGx5UVNo?=
 =?utf-8?B?QXNvLy9PNTEzb2R1cWVpdVRiYkEvQ2J0eEppWFZNMTJHUWtHN1FLaDlhUGxN?=
 =?utf-8?B?K1FVU3czVWo1a3NJd0FJaWFSL0JtOXZ1Y1dOT0o1M1NFYnNkRFNHNUNhVENT?=
 =?utf-8?B?T3FHUW9yWVdwVll6TVU1cEdubDR2WWdCWlQxbGlNM1o3azlZeGNHWmI2R29B?=
 =?utf-8?B?bDVvc2Y1RFQxQkN4RXdnc2x5emNUSkdxdE1POXlnZmQ4Yklpd3U5TWhLSDVV?=
 =?utf-8?B?UDQ2a1BCNXFETXBSMmx0ZDlEZ0VXN2xCaTVFd1hybEE5OHM0eHVUeE5yTzNV?=
 =?utf-8?B?ZEJvRmlzMmtFUjVjN1lhdUhkV3JSNnpnZEk0ck55MDV2VE1wM29ocnpxQjFr?=
 =?utf-8?B?c0FFbjJMZ0RwOTRycXFZdmQzMkRYNFQ2VTA5Ui9RS3YzQnpvMTRQNklld0w3?=
 =?utf-8?B?R2JZUitQZ0FTaThuNk1uR1paWTJ6R0FjQy9qblpqS3FxQ2krdzFGUi95S0JM?=
 =?utf-8?B?aVpUQWdjSlAvNEJQK1hYN1huMWdpeENIVlYrejhTOGdsSnBwbUpvRXZXVHln?=
 =?utf-8?B?NGtlbnNCSHVsTFlobVRoUmRvazRmTnBOaS9VMnlDYU5sb2dtVlZabkQ2TktH?=
 =?utf-8?B?ZnhzVWhNRWFQUUZGZ3F3VmhvNFRSbmdVNFhEUWxwWXVzb1FTd2xXU0lnUEV1?=
 =?utf-8?B?Y2F3Y21rT1hicnN4WjVUanRUR0ZKYTBVRFdhNTc2VFRkcUt4SE5SWmlqWWZx?=
 =?utf-8?B?YXhudkFOVWlLTG1hMEMwYWpNYmFVNjZsMnJCalFPQ0ZMS084N1FnRnR1cFd5?=
 =?utf-8?B?SERqbXJkN1pGTHlPVzdaNmpLbXBiOVZsM2xIZkVZQTI2RytMWG5CYUJxMkY4?=
 =?utf-8?B?SXdCeFZVK245ejhKN3gzeTZJTkkzTExTU01mMVhRM1NXNHlFQlFzUEFESlNr?=
 =?utf-8?B?OCtWWEJLRUk1SzdnZ1FmSFJtMHN2TzRJbGJwMVhhYWRxL0t1MmtTNGNSYVZZ?=
 =?utf-8?B?N0RoNThiQXNZV3gxalNVR0N2bFBxNE5YV25maUE5NXFITWhWeDJVWStOU0hU?=
 =?utf-8?B?MitoZGtFaFduNEswMHBLL01WZ0Foend5eXZiTGtKRmplSW9hL2V3MTdxaWR0?=
 =?utf-8?B?djFhWkk5UmNYOGpuMWV0Z0Q2bkd2VnRxcWtMNG55WmowR3RVclp2UlJ1ZGlk?=
 =?utf-8?B?cFcrSEE5cnJzWStsZ0R5VHk2Q1ZIR3pqZFJJVWErN2c5R1RzdXFCRW5Qc3Zi?=
 =?utf-8?B?OE1tTTJSdmJzQ1QwbHBqLytpN3ozUkdGZlJkSWNrSS9VTTNKeGxMOThFQkEw?=
 =?utf-8?B?YkFGMVA0M2dMR1k4YUQrc25rcnE5TzdTOXVaQ3AwSFNjZzhhVnpIT3FpZUF2?=
 =?utf-8?B?Y0JBd1BhR212VkdUTEo1bkhCMnFvbHdKZ2NxZW5wdmhKb1hZUitKRzRLWW9V?=
 =?utf-8?B?eEI1aERob0dPRUQvaFFnNVJ6c3BTUzlUc0hzTnlDZDNvdVJ2dTAwamplU29l?=
 =?utf-8?B?SHpSQ05HWTJBRVN0b3R1cERDbjY1ZlhXM1V6LzNFb2ZDYU9DVm04ck1hZktq?=
 =?utf-8?B?MkcwNE5xTjlmbkZNZ09wcU5QaDI0Tk9OWmxaMXFUM3UxZ0tXWko1R0p5bm01?=
 =?utf-8?B?UlplWkZ4ZGhCOHZETVljdjh2emxWWWk2NlZxNm9YQkhkcE1LTG94aWRNWDNi?=
 =?utf-8?B?ZWlUL2tNejNmT1lBM2w0VHNhWU4zL1hlUzFzTmp4Rm1BYmUzendxU3ltT3hN?=
 =?utf-8?Q?XqycfrJ9bxyq7?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR04MB3769
X-DLP: MSGProcess
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: PU1APC01FT013.eop-APC01.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 880b8ab8-b602-4c49-6839-08d8dd42ba6f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gpAvwYjCylna/qHDWEaht8wnMk+XeF17gLEnW9zUwtTkI57QlTsPRqfbK0JJC6Txs9ZRzd76/Eeh9/L9+APZ80VWGqk6EsPvnTlZZVI56URgevZNvTIAdfq2OjBcZzGXgEjagIPU6Xoqln32Am6gmkq5PjpGio33cVOvjaKdkgjXwM5W98ZMkcLQF0WphqDW9r4vxKLDa/Co4Br+e+7nj7YYluRVYig8SXVxkycroGPQuS/PovzebPqgs1d0pNwGh2RIeSdufRQVp+p0vi6MldUyK8iNCMyZolgiRBuB7ktAh+cne4ywh8sezqBktY0uTURIsnsarkeNpHs6i9Y/RlWlg57YB7BWhej2+Pozk6UUnU1ndcJ5zM7TFZa9oZvZ+Lu8nkYmGb2f9rK+vHOIfsSYS+0kehChgDXivxHwk6eLNCGNuMlpojAFEeh8yAUzRFVHiDyVFheLbz1ThJGnFh86xEujc3jzEJouRzT/0nhqYcjQCQpHtXPQxwcenkfaVSv+J7sMbK/5B6YWmWotNRlgwmfWF12FUq+iXwPSW/WqhXkuo7dH9nLC9eVhmAQde7HKkNPGQRTVbgNa8j59+xwaL8HHbWlBnsdKixxAtKlCysPOimIEoIAPFnucKYt8M/wD8dvwqgAgIcDluT0SLWiloqcPLzrgySbXbGkXIZp1sjaxoW+FjMBoS3mhrc3t494/dEAmyWmWuVlVsoYxYjecNtzJuudwdJ8o9OS9wNA=
X-Forefront-Antispam-Report: CIP:192.8.195.57; CTRY:IN; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:APC01-PU1-obe.outbound.protection.outlook.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(39860400002)(136003)(396003)(346002)(376002)(46966006)(36840700001)(336012)(81166007)(9686003)(83380400001)(316002)(34020700004)(82740400003)(82310400003)(47076005)(36906005)(478600001)(7696005)(33656002)(36860700001)(4326008)(53546011)(356005)(6506007)(6916009)(52536014)(8676002)(70586007)(2906002)(5660300002)(55016002)(70206006)(186003)(26005)(8936002)(86362001)(36900700001);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: HCL.COM
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2021 06:16:37.2183 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9655a8fc-c6f6-4a92-47c1-08d8dd42bcf2
X-MS-Exchange-CrossTenant-Id: 189de737-c93a-4f5a-8b68-6f4ca9941912
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=189de737-c93a-4f5a-8b68-6f4ca9941912; Ip=[192.8.195.57];
 Helo=[APC01-PU1-obe.outbound.protection.outlook.com]
X-MS-Exchange-CrossTenant-AuthSource: PU1APC01FT013.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR04MB2953
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

Q2xhc3NpZmljYXRpb246IENvbmZpZGVudGlhbA0KDQpUaGFua3MgRWQgZm9yIHlvdXIgcmVzcG9u
c2UuDQpJJ2xsIGxvb2sgaW50byB0aGUgc3BlY3MuDQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0t
LS0tDQpGcm9tOiBFZCBUYW5vdXMgPGVkdGFub3VzQGdvb2dsZS5jb20+IA0KU2VudDogRnJpZGF5
LCBGZWJydWFyeSAyNiwgMjAyMSA5OjU3IFBNDQpUbzogSmF5YXNocmVlIEQgPGpheWFzaHJlZS1k
QGhjbC5jb20+DQpDYzogb3BlbmJtY0BsaXN0cy5vemxhYnMub3JnDQpTdWJqZWN0OiBSZTogTmVn
YXRpdmUgdmFsdWUgcmV0dXJucyBmb3Igc2Vuc29yIGluIHRpb2dhcGFzcw0KDQpbQ0FVVElPTjog
VGhpcyBFbWFpbCBpcyBmcm9tIG91dHNpZGUgdGhlIE9yZ2FuaXphdGlvbi4gVW5sZXNzIHlvdSB0
cnVzdCB0aGUgc2VuZGVyLCBEb27igJl0IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMg
YXMgaXQgbWF5IGJlIGEgUGhpc2hpbmcgZW1haWwsIHdoaWNoIGNhbiBzdGVhbCB5b3VyIEluZm9y
bWF0aW9uIGFuZCBjb21wcm9taXNlIHlvdXIgQ29tcHV0ZXIuXQ0KDQpPbiBGcmksIEZlYiAyNiwg
MjAyMSBhdCAxMjo1NSBBTSBKYXlhc2hyZWUgRCA8amF5YXNocmVlLWRAaGNsLmNvbT4gd3JvdGU6
DQo+DQo+IENsYXNzaWZpY2F0aW9uOiBQdWJsaWMNCj4NCj4gSGkgVGVhbSwNCj4NCj4NCj4NCj4g
UmVjZW50bHksIEkgaGF2ZSB0ZXN0ZWQgc2Vuc29ycyBmb3IgdGlvZ2FwYXNzLCBpbiB3aGljaCBv
bmUgc2Vuc29yIHJldHVybnMgbmVnYXRpdmUgdmFsdWUuDQo+DQo+IEFmdGVyIGFuYWx5c2luZyB0
aGUgY29kZSBpbiB0aGUgZGJ1cy1zZW5zb3JzIHJlcG8sIEkgZm91bmQgdGhlIGZvbGxvd2luZyBp
c3N1ZS4NCj4NCj4NCj4NCj4gZGJ1cy1zZW5zb3JzL0lwbWJTZW5zb3IuY3BwIGF0IG1hc3RlciDC
tyBvcGVuYm1jL2RidXMtc2Vuc29ycyANCj4gKGdpdGh1Yi5jb20pDQo+DQo+DQo+DQo+IEZyb20g
dGhlIGFib3ZlIGxpbmssIFdlIG5lZWQgb25seSBiZWxvdyBsaW5lIGluIHRoZSBjb2RlIHRvIHBy
b2Nlc3MgdGhlIEhTQyBzZW5zb3JzIHZhbHVlIGZvciB0aW9nYXBhc3MuDQo+DQo+DQo+DQo+IGlu
dDE2X3QgdmFsdWUgPSAoKGRhdGFbNF0gPDwgOCkgfCBkYXRhWzNdKTsNCj4NCj4NCj4NCj4gU2lu
Y2UgdGhlIGJlbG93IGxvZ2ljIGlzIGFkZGVkLCB0aGUgdmFsdWVzIGdldCBzaGlmdGVkIGFuZCBn
ZXR0aW5nIG5lZ2F0aXZlIHZhbHVlcyBhcyBvdXRwdXQuDQo+DQo+DQo+DQo+IGNvbnN0ZXhwciBj
b25zdCBzaXplX3Qgc2hpZnQgPSAxNiAtIDExOyAvLyAxMWJpdCBpbnRvIDE2Yml0DQo+DQo+IHZh
bHVlIDw8PSBzaGlmdDsNCj4NCj4gdmFsdWUgPj49IHNoaWZ0Ow0KPg0KPg0KPg0KPiBDb3VsZCB5
b3UgcGxlYXNlIHN1Z2dlc3QgYW55IGlkZWEgdG8gcmVzb2x2ZSB0aGlzIGlzc3VlLg0KDQpJIGhh
dmVuJ3QgbG9va2VkIGF0IHRoaXMgaW4gZGV0YWlsLCBidXQgd2Ugc2hvdWxkIGZvbGxvdyB3aGF0
ZXZlciB0aGUgc3BlYyBzYXlzIGhlcmUuICBJZiB3aG9tZXZlciB3cm90ZSB0aGlzIG9yaWdpbmFs
bHkgcHV0IGluIHRoZSB3cm9uZyBtYXRoICh3aGljaCBzZWVtcyBsaWtlbHksIGdpdmVuIHRoZXkg
d2VyZSBpbXBsZW1lbnRpbmcgNCB0eXBlcyBhbmQgcHJvYmFibHkgb25seSB1c2luZyBvbmUpIHRo
ZW4gd2Ugc2hvdWxkIGp1c3QgZ2V0IGl0IGZpeGVkIGFuZCBkbyB3aGF0IHRoZSBzcGVjIHNheXMu
DQoNCj4NCj4NCj4NCj4gUmVnYXJkcywNCj4NCj4gSmF5YXNocmVlDQo+DQo+DQo+DQo+IDo6RElT
Q0xBSU1FUjo6DQo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQo+IFRoZSBjb250
ZW50cyBvZiB0aGlzIGUtbWFpbCBhbmQgYW55IGF0dGFjaG1lbnQocykgYXJlIGNvbmZpZGVudGlh
bCBhbmQgaW50ZW5kZWQgZm9yIHRoZSBuYW1lZCByZWNpcGllbnQocykgb25seS4gRS1tYWlsIHRy
YW5zbWlzc2lvbiBpcyBub3QgZ3VhcmFudGVlZCB0byBiZSBzZWN1cmUgb3IgZXJyb3ItZnJlZSBh
cyBpbmZvcm1hdGlvbiBjb3VsZCBiZSBpbnRlcmNlcHRlZCwgY29ycnVwdGVkLCBsb3N0LCBkZXN0
cm95ZWQsIGFycml2ZSBsYXRlIG9yIGluY29tcGxldGUsIG9yIG1heSBjb250YWluIHZpcnVzZXMg
aW4gdHJhbnNtaXNzaW9uLiBUaGUgZSBtYWlsIGFuZCBpdHMgY29udGVudHMgKHdpdGggb3Igd2l0
aG91dCByZWZlcnJlZCBlcnJvcnMpIHNoYWxsIHRoZXJlZm9yZSBub3QgYXR0YWNoIGFueSBsaWFi
aWxpdHkgb24gdGhlIG9yaWdpbmF0b3Igb3IgSENMIG9yIGl0cyBhZmZpbGlhdGVzLiBWaWV3cyBv
ciBvcGluaW9ucywgaWYgYW55LCBwcmVzZW50ZWQgaW4gdGhpcyBlbWFpbCBhcmUgc29sZWx5IHRo
b3NlIG9mIHRoZSBhdXRob3IgYW5kIG1heSBub3QgbmVjZXNzYXJpbHkgcmVmbGVjdCB0aGUgdmll
d3Mgb3Igb3BpbmlvbnMgb2YgSENMIG9yIGl0cyBhZmZpbGlhdGVzLiBBbnkgZm9ybSBvZiByZXBy
b2R1Y3Rpb24sIGRpc3NlbWluYXRpb24sIGNvcHlpbmcsIGRpc2Nsb3N1cmUsIG1vZGlmaWNhdGlv
biwgZGlzdHJpYnV0aW9uIGFuZCAvIG9yIHB1YmxpY2F0aW9uIG9mIHRoaXMgbWVzc2FnZSB3aXRo
b3V0IHRoZSBwcmlvciB3cml0dGVuIGNvbnNlbnQgb2YgYXV0aG9yaXplZCByZXByZXNlbnRhdGl2
ZSBvZiBIQ0wgaXMgc3RyaWN0bHkgcHJvaGliaXRlZC4gSWYgeW91IGhhdmUgcmVjZWl2ZWQgdGhp
cyBlbWFpbCBpbiBlcnJvciBwbGVhc2UgZGVsZXRlIGl0IGFuZCBub3RpZnkgdGhlIHNlbmRlciBp
bW1lZGlhdGVseS4gQmVmb3JlIG9wZW5pbmcgYW55IGVtYWlsIGFuZC9vciBhdHRhY2htZW50cywg
cGxlYXNlIGNoZWNrIHRoZW0gZm9yIHZpcnVzZXMgYW5kIG90aGVyIGRlZmVjdHMuDQo+IF9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fDQo=
