class WorkOutPlan {
  final int? workOutPlanId;
  final int userId;
  final String decription;
  final String workOutDate ;


  WorkOutPlan({
    this.workOutPlanId,
    required this.userId,
    required this.decription,
    required this.workOutDate,
   
  });

  factory WorkOutPlan.fromMap(Map<String, dynamic> json) => WorkOutPlan(
      workOutPlanId: json['workOutPlanId'],
      userId: json['userId'],
      decription: json['decription'],
      workOutDate: json['workOutDate'],
  );
     

 Map<String, dynamic> toMap() => {
        "workOutPlanId": workOutPlanId,
        "userId": userId,
        "decription": decription,
        "workOutDate": workOutDate,
      };
}
