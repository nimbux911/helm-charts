{{/* 
Generate common labels
 */}}
{{- define "base-app.common-labels" }}
helm.sh/chart: {{ .Chart.Name }}-{{ .Chart.Version }}
app.kubernetes.io/name: {{ .Chart.Name }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion }}
app: {{ .Release.Name }}
{{- if .Values.global }}
{{- if .Values.global.labels }}
{{- range $key, $val := .Values.global.labels }}
{{ $key }}: {{ $val | quote }}
{{- end }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Expand the name of the chart.
*/}}
{{- define "base-app.resourceName" }}
{{- if .Values.global }}
{{- if .Values.global.resourceNameOverride }}
{{- .Values.global.resourceNameOverride }}
{{- else }}
{{- .Release.Name }}
{{- end }}
{{- end }}
{{- end }}

